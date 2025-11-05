return {
  "adalessa/laravel.nvim",
  dependencies = {
    -- "nvim-telescope/telescope.nvim",
    "tpope/vim-dotenv",
    "MunifTanjim/nui.nvim",
    "kevinhwang91/promise-async",
  },
  cmd = { "Laravel", "Artisan" },
  keys = {
    { "<leader>la", ":Laravel artisan<cr>", desc = "Artisan" },
    { "<leader>lr", ":Laravel routes<cr>", desc = "Routes" },
  },
  opts = { lsp_server = "intelephense" },
}
