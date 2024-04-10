local lualine_snippet = {
  "lualine",
  "lualine_snippet",
  {
    trigger = "lualine",
    snippet = {
      -- The snippet code goes here
      "\\v<(lualine)>",
      "local lualine = require('lualine')",
      "lualine.setup({options = {...}})",
    },
  },
}
