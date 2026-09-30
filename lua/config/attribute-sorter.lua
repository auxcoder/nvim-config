local M = {}

-- Attribute priority maps per element type.
-- Lower number = appears first. Unlisted attributes get a high default.
-- Extend this table to support more elements in the future.
M.element_priorities = {
  img = {
    ["class"] = 1,
    ["src"] = 10,
    ["srcset"] = 11,
    ["sizes"] = 12,
    ["alt"] = 20,
    ["width"] = 30,
    ["height"] = 31,
    ["loading"] = 40,
    ["decoding"] = 41,
    ["fetchpriority"] = 42,
    ["id"] = 50,
    ["style"] = 60,
    -- data-* and aria-* handled via pattern matching in get_attr_priority
  },
}

-- Elements to process. Add more tag names here as you extend.
M.target_elements = { "img" }

local function get_attr_priority(element, attr_name)
  local map = M.element_priorities[element]
  if not map then
    return 1000
  end

  -- Direct match
  if map[attr_name] then
    return map[attr_name]
  end

  -- Pattern-based fallback for data-* and aria-*
  if attr_name:find("^data%-") then
    return 900
  end
  if attr_name:find("^aria%-") then
    return 910
  end

  return 950
end

--- Reconstruct an opening tag with sorted attributes.
--- @param tag_name string
--- @param attrs table list of {name, value_node, full_text} tables
--- @param self_closing boolean
--- @return string
local function build_tag(tag_name, attrs, self_closing)
  local parts = { "<" .. tag_name }
  for _, attr in ipairs(attrs) do
    table.insert(parts, " " .. attr.full_text)
  end
  if self_closing then
    table.insert(parts, " />")
  else
    table.insert(parts, ">")
  end
  return table.concat(parts)
end

--- Sort attributes on target elements in the current buffer.
M.sort_element_attributes = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.bo[bufnr].filetype

  -- Determine parser language (blade uses html parser)
  local lang = ft
  if ft == "blade" then
    lang = "blade"
  end

  local ok, parser = pcall(vim.treesitter.get_parser, bufnr, lang)
  if not ok or not parser then
    return
  end

  local tree = parser:parse()[1]
  if not tree then
    return
  end
  local root = tree:root()

  -- Build a query that matches start tags for our target elements
  -- We look for self_closing_tag and start_tag nodes with matching tag_name
  local tag_patterns = {}
  for _, element in ipairs(M.target_elements) do
    table.insert(
      tag_patterns,
      string.format('(self_closing_tag (tag_name) @tag_name (#eq? @tag_name "%s")) @self_tag', element)
    )
    table.insert(
      tag_patterns,
      string.format('(start_tag (tag_name) @tag_name (#eq? @tag_name "%s")) @start_tag', element)
    )
  end
  local query_str = table.concat(tag_patterns, "\n")

  local ok_query, query = pcall(vim.treesitter.query.parse, lang, query_str)
  if not ok_query then
    return
  end

  local changes = {}

  for id, node in query:iter_captures(root, bufnr, 0, -1) do
    local capture_name = query.captures[id]
    if capture_name == "self_tag" or capture_name == "start_tag" then
      local self_closing = (capture_name == "self_tag")
      local tag_name = nil
      local attrs = {}

      -- Iterate child nodes to extract tag_name and attributes
      for child in node:iter_children() do
        local child_type = child:type()
        if child_type == "tag_name" then
          tag_name = vim.treesitter.get_node_text(child, bufnr)
        elseif child_type == "attribute" then
          local attr_text = vim.treesitter.get_node_text(child, bufnr)
          -- Extract attribute name (first child of attribute node)
          local name_node = child:child(0)
          local attr_name = name_node and vim.treesitter.get_node_text(name_node, bufnr) or attr_text
          table.insert(attrs, { name = attr_name, full_text = attr_text })
        end
      end

      if tag_name and #attrs > 1 then
        -- Sort attributes by priority
        local element = tag_name:lower()
        table.sort(attrs, function(a, b)
          local p1 = get_attr_priority(element, a.name)
          local p2 = get_attr_priority(element, b.name)
          if p1 == p2 then
            return a.name < b.name
          end
          return p1 < p2
        end)

        -- Build the new tag text
        local new_text = build_tag(tag_name, attrs, self_closing)
        local range = { node:range() } -- start_row, start_col, end_row, end_col

        -- Only store if the text actually changed
        local original = vim.treesitter.get_node_text(node, bufnr)
        if new_text ~= original then
          table.insert(changes, 1, { range = range, text = new_text })
        end
      end
    end
  end

  -- Apply changes in reverse order to preserve positions
  for _, change in ipairs(changes) do
    local lines = vim.split(change.text, "\n", { plain = true })
    vim.api.nvim_buf_set_text(bufnr, change.range[1], change.range[2], change.range[3], change.range[4], lines)
  end
end

return M
