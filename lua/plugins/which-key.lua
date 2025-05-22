return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      opts = opts or {}
      
      -- Add triggers that shouldn't show the which-key popup
      opts.triggers_nowait = vim.list_extend(opts.triggers_nowait or {}, {
        "`", "'", "g`", "g'", '"', "<c-r>", "z=",
      })
      
      -- Ignore overlapping keymaps
      opts.ignore_missing = true
      
      -- Customize the appearance
      opts.window = {
        border = "rounded",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 1, 2, 1, 2 },
      }
      
      return opts
    end,
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