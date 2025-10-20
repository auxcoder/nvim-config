local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
-- local t = ls.text_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s(
    "log",
    fmt('console.log("{}", {}); // eslint-disable-line\n{}', {
      i(1, "hint"),
      f(function(_, snip)
        return snip.env.TM_SELECTED_TEXT and snip.env.TM_SELECTED_TEXT[1] or ""
      end, {}),
      i(0),
    })
  ),
}
