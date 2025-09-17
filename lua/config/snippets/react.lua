local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local rep = require("luasnip.extras").rep

-- Extract prop names from a TS interface using Treesitter
local function get_prop_names(interface_node)
  local object_type_node = interface_node:child(2)
  if not object_type_node or object_type_node:type() ~= "object_type" then
    return {}
  end

  local prop_names = {}
  local bufnr = vim.api.nvim_get_current_buf()

  for prop in object_type_node:iter_children() do
    if prop:type() == "property_signature" then
      local ident = prop:child(0)
      local name = vim.treesitter.query.get_node_text(ident, bufnr)
      table.insert(prop_names, name)
    end
  end

  return prop_names
end

-- Infer a component name based on the filename and directory
local function infer_component_name()
  local filename = vim.fn.expand("%:t")
  local dirname = vim.fn.expand("%:p:h:t")

  if filename == "index.tsx" then
    return dirname
  else
    return filename:gsub("%..*$", "")
  end
end

ls.add_snippets("typescriptreact", {
  s(
    "comp",
    fmt(
      [[
      {}interface {}Props {{
        {}
      }}

      export const {} = ({{ {} }}: {}Props) => {{
        return {};
      }};
    ]],
      {
        i(1, "export"),

        d(2, function()
          return sn(nil, { i(1, infer_component_name()) })
        end, {}),

        i(3, "// Props"),

        d(4, function()
          return sn(nil, { i(1, infer_component_name()) })
        end, {}),

        f(function(_, snip)
          local target_node = snip.nodes[6]
          if not target_node or not target_node.mark then
            return ""
          end

          local start_pos = target_node.mark:pos_begin()
          local end_pos = target_node.mark:pos_end()

          local parser = vim.treesitter.get_parser(0, "tsx")
          local tree = parser:parse()[1]
          local root = tree:root()
          local node = root:named_descendant_for_range(start_pos[1], start_pos[2], end_pos[1], end_pos[2])

          while node and node:type() ~= "interface_declaration" do
            node = node:parent()
          end

          if not node then
            return ""
          end
          return table.concat(get_prop_names(node), ", ")
        end, {}),

        rep(2),
        i(5, "null"),
      }
    )
  ),
})
