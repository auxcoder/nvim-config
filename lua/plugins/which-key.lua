return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      win = {
        border = "rounded",
        padding = { 1, 2 },
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
    },
    keys = {
      { "<leader>b", group = "buffer" },
      { "<leader>dp", group = "profiler" },
      { "<leader>g", group = "git" },
      { "<leader>q", group = "session" },
      { "<leader>s", group = "search" },
      { "<leader>u", group = "ui" },
      { "gc", group = "comment" },
      { "a", group = "around", mode = { "o", "x" } },
      { "i", group = "inside", mode = { "o", "x" } },
    },
  },
}