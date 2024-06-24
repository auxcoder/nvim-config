local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

return {
  ls.s( -- Link {{{
    {
      trig = "clg",
      name = "console_log",
      dscr = "Create console log expression, console.log('hint', value).",
    },
    -- t("console.log("), i(1), t(");"),
    fmt('console.log("{}", {});\n{}', {
      ls.i(1),
      ls.f(function(_, snip)
        return snip.env.TM_SELECTED_TEXT[1] or {}
      end, {}),
      ls.i(0),
    })
  ), --}}}
}
