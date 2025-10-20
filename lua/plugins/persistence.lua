-- Session management plugin
return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      -- directory where session files are saved
      dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),

      -- session save options
      options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" },

      -- only save session when there are more than one buffer open
      pre_save = function()
        return vim.fn.len(vim.fn.getbufinfo({ buflisted = 1 })) > 1
      end,
    },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },
}
