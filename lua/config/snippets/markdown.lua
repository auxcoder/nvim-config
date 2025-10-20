local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s( -- Link {{{
    {
      trig = "link",
      name = "markdown_link",
      dscr = "Create markdown link [txt](url).\nSelect link, press C-s, type link.",
    },
    fmt("[{}]({})\n{}", {
      i(1),
      f(function(_, snip)
        return (snip.env.TM_SELECTED_TEXT or {})[1] or ""
      end, {}),
      i(0),
    })
  ), --}}}

  s( -- Codeblock {{{
    {
      trig = "codeblock",
      name = "Make code block",
      dscr = "Select text, press <C-s>, type codeblock.",
    },
    fmt("```{}\n{}\n```\n{}", {
      i(1, "Language"),
      f(function(_, snip)
        local tmp = snip.env.TM_SELECTED_TEXT
        return tmp or {}
      end, {}),
      i(0),
    })
  ), --}}}
}
