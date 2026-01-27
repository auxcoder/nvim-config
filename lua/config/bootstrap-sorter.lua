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
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local new_lines = {}

  for _, line in ipairs(lines) do
    -- This handles class="foo bar" or class='foo bar'
    local updated_line = line:gsub("class=([\"'])(.-)%1", function(quote, class_string)
      local classes = {}
      for class in class_string:gmatch("%S+") do
        table.insert(classes, class)
      end

      table.sort(classes, function(a, b)
        local p1 = get_priority(a)
        local p2 = get_priority(b)
        if p1 == p2 then
          return a < b
        end -- Alphabetical if same priority
        return p1 < p2
      end)

      return "class=" .. quote .. table.concat(classes, " ") .. quote
    end)
    table.insert(new_lines, updated_line)
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, new_lines)
end

return M
