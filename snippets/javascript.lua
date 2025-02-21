local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

return {
  ls.s(
    "clg", -- using the trigger as the first parameter directly
    fmt('console.log("{}", {});\n{}', {
      ls.insert_node(1, "hint"),
      ls.function_node(function(_, snip)
        return snip.env.TM_SELECTED_TEXT and snip.env.TM_SELECTED_TEXT[1] or ""
      end, {}),
      ls.insert_node(0),
    })
  ),
}
