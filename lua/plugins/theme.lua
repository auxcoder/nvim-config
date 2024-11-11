return {
  -- { "projekt0n/github-nvim-theme" },
  -- { "folke/tokyonight.nvim" },
  -- { "ellisonleao/gruvbox.nvim" },
  -- { "joshdick/onedark.vim" },
  -- { "EdenEast/nightfox.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "frappe",
    },
    -- config = function()
    --   Colors = require("catppuccin.palettes").get_palette("frappe")
    --   require("catppuccin").setup({
    --     custom_highlights = function(Colors)
    --       return {
    --         VertSplit = { fg = Colors.overlay0 },
    --         Comment = { fg = Colors.flamingo },
    --       }
    --     end,
    --   })
    -- end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      lazy = true,
      priority = 1000,
      colorscheme = "catppuccin",
      -- colorscheme = "github_dark_dimmed",
      -- colorscheme = "gruvbox",
      -- colorscheme = "onedark",
      -- colorscheme = "nordfox", -- nightfox
    },
  },
}
