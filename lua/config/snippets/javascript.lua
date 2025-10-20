local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
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

  s("fun", {
    t("function "),
    i(1, "functionName"),
    t("("),
    i(2),
    t({ ") {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("arrf", {
    i(1, "array"),
    t(".forEach(item => {"),
    t({ "", "\t" }),
    i(0),
    t({ "", "})" }),
  }),

  s("ife", {
    t("if ("),
    i(1),
    t({ ") {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("forl", {
    t("for (let i = 0; i < "),
    i(1),
    t({ "; i++) {", "\t" }),
    i(0),
    t({ "", "}" }),
  }),

  s("newp", {
    t("new Promise((resolve, reject) => {"),
    t({ "", "\t" }),
    i(1),
    t({ "", "})" }),
    t({ ".then(() => {", "\t" }),
    i(2),
    t({ "", "})" }),
    t({ ".catch(() => {", "\t" }),
    i(0),
    t({ "", "})" }),
  }),
}
