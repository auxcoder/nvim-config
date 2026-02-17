return {
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    -- Lazy.nvim will call require("better_escape").setup(opts)
    opts = {
      timeout = vim.o.timeoutlen,
      default_mappings = true,
      mappings = {
        i = {
          j = { k = "<Esc>", j = "<Esc>" },
        },
        c = { j = { k = "<C-c>", j = "<C-c>" } },
        t = { j = { k = "<C-\\><C-n>" } },
        v = { j = { k = "<Esc>" } },
        s = { j = { k = "<Esc>" } },
      },
    },
  },
}
