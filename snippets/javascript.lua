local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt

return {
  ls.s(
    "cl", -- using the trigger as the first parameter directly
    fmt('console.log("{}", {}); // eslint-disable-line\n{}', {
      ls.insert_node(1, "hint"),
      ls.function_node(function(_, snip)
        return snip.env.TM_SELECTED_TEXT and snip.env.TM_SELECTED_TEXT[1] or ""
      end, {}),
      ls.insert_node(0),
    })
  ),
  ls.s("fun", {
    ls.text("function "),
    ls.insert(1, "functionName"),
    ls.text("("),
    ls.insert(2),
    ls.text(") {"),
    ls.text("\n\t"),
    ls.insert(0),
    ls.text("\n}"),
  }),
  ls.s("arrf", {
    ls.insert(1, "array") .. ls.text(".forEach(item => {\n\t") .. ls.insert(0) .. "\n})",
  }),
  ls.s("ife", {
    ls.text("if ("),
    ls.insert(1),
    ls.text(") {"),
    ls.text("\n\t"),
    ls.insert(0),
    ls.text("\n}"),
  }),
  ls.s("forl", {
    ls.text("for (let i = 0; i < "),
    ls.insert(1),
    ls.text("; i++) {"),
    ls.text("\n\t"),
    ls.insert(0),
    ls.text("\n}"),
  }),
  ls.s("prom", {
    ls.text("new Promise((resolve, reject) => {"),
    ls.text("\n\t"),
    ls.insert(0),
    ls.text("\n})"),
    ls.text(".then(() => {"),
    ls.text("\n\t"),
    ls.insert(1),
    ls.text("\n})"),
    ls.text(".catch(() => {"),
    ls.text("\n\t"),
    ls.insert(2),
    ls.text("\n})"),
  }),
}
