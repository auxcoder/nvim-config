return {
  {
    "sindrets/diffview.nvim", -- https://github.com/sindrets/diffview.nvim?#configuration
    cmd = { "DiffviewOpen", "DiffviewClose" },
    keys = {
      { "<leader>dfo", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
      { "<leader>dfc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
      { "<leader>dfh", "<cmd>DiffviewFileHistory<cr>", desc = "File History" },
    },
    opts = {
      file_panel = {
        win_config = {
          position = "left",
          width = 35,
        },
      },
    },
  },
  {
    "TimUntersberger/neogit",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Open Neogit" },
    },
    opts = {
      integrations = {
        diffview = true,
      },
    },
  },
}
