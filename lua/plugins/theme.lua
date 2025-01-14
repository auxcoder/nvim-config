return {
  -- { "projekt0n/github-nvim-theme" },
  -- { "folke/tokyonight.nvim" },
  -- { "ellisonleao/gruvbox.nvim" },
  -- { "joshdick/onedark.vim" },
  { "EdenEast/nightfox.nvim" },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   opts = {
  --     flavour = "frappe",
  --   },
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      lazy = true,
      priority = 1000,
      -- colorscheme = "catppuccin",
      -- colorscheme = "github_dark_dimmed",
      -- colorscheme = "gruvbox",
      -- colorscheme = "onedark",
      colorscheme = "nightfox", -- nordfox, nightfox
    },
  },
}
