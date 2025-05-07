return {
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    opts = {
      mapping = { "jj" }, -- Mapping to escape insert mode
      timeout = 300, -- Timeout in ms
      clear_empty_lines = false, -- Clear line after escaping if there is only whitespace
      keys = "<Esc>", -- Keys used for escaping, if it is a function will use the result everytime
    },
  },
}
