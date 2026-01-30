local M = {}

-- Define the hierarchy
local priority_map = {
  -- 1. Layout & Containers
  ["container"] = 1,
  ["row"] = 2,
  ["col%-"] = 3,
  ["vstack"] = 4,
  ["hstack"] = 5,

  -- 2. Positioning & Z-Index
  ["position%-"] = 10,
  ["top%-"] = 11,
  ["bottom%-"] = 12,
  ["start%-"] = 13,
  ["end%-"] = 14,
  ["z%-"] = 15,

  -- 3. Display & Flexbox
  ["d%-"] = 20,
  ["flex%-"] = 21,
  ["justify%-"] = 22,
  ["align%-"] = 23,
  ["order%-"] = 24,

  -- 4. Spacing (Margin & Padding)
  ["m[tblrxy]?%-"] = 30,
  ["p[tblrxy]?%-"] = 31,
  ["g[xy]?%-"] = 32,

  -- 5. Typography & Colors (v5.3 Color Modes)
  ["text%-"] = 40,
  ["bg%-"] = 41,
  ["link%-"] = 42,
  ["focus%-ring"] = 43,

  -- 6. Components
  ["btn"] = 50,
  ["card"] = 51,
  ["nav"] = 52,
  ["navbar"] = 53,
  ["modal"] = 54,
  ["alert"] = 55,

  -- 7. Utilities (Borders, Shadow, Sizing)
  ["border"] = 60,
  ["rounded"] = 61,
  ["shadow"] = 62,
  ["w%-"] = 63,
  ["h%-"] = 64,
  ["object%-fit"] = 65,

  -- 8. States & Interactions
  ["opacity%-"] = 70,
  ["disabled"] = 71,
  ["active"] = 72,
}

local function get_priority(class_name)
  for pattern, priority in pairs(priority_map) do
    if class_name:find("^" .. pattern) then
      return priority
    end
  end
  return 100
end

M.sort_file_classes = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.bo[bufnr].filetype

  -- Use Tree-sitter to find the classes accurately
  local ok, parser = pcall(vim.treesitter.get_parser, bufnr, ft)
  if not ok or not parser then
    return
  end

  local tree = parser:parse()[1]
  local root = tree:root()

  -- This query specifically finds the content of "class" attributes
  local query_str = [[
    (attribute
      (attribute_name) @attr_name (#eq? @attr_name "class")
      (quoted_attribute_value (attribute_value) @class_val))
  ]]
  
  local ok_query, query = pcall(vim.treesitter.query.parse, ft, query_str)
  if not ok_query then
    return
  end

  local changes = {}

  for id, node in query:iter_captures(root, bufnr, 0, -1) do
    if query.captures[id] == "class_val" then
      local class_string = vim.treesitter.get_node_text(node, bufnr)

      -- If it looks like an Angular expression (contains { } : ? or |), SKIP IT
      if not class_string:find("[{}:?|]") then
        local range = { node:range() }
        local classes = {}
        for class in class_string:gmatch("%S+") do
          table.insert(classes, class)
        end

        table.sort(classes, function(a, b)
          local p1, p2 = get_priority(a), get_priority(b)
          return p1 == p2 and a < b or p1 < p2
        end)

        -- Store the change (working backwards so positions don't shift)
        table.insert(changes, 1, { range = range, text = table.concat(classes, " ") })
      end
    end
  end

  -- Apply only the valid changes to the buffer
  for _, change in ipairs(changes) do
    vim.api.nvim_buf_set_text(
      bufnr,
      change.range[1],
      change.range[2],
      change.range[3],
      change.range[4],
      { change.text }
    )
  end
end

return M
