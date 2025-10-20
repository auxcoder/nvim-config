-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     style = "moon", -- other options: "night", "storm", "day", "moon"
--     transparent = false,
--     terminal_colors = true,
--     styles = {
--       comments = { italic = true },
--       keywords = { italic = true },
--       functions = {},
--       variables = {},
--       sidebars = "dark", -- style for sidebars like NvimTree, etc
--       floats = "dark", -- style for floating windows
--     },
--     sidebars = { "qf", "help", "packer", "lazy", "terminal", "nvim-tree" },
--     dim_inactive = false,
--     lualine_bold = true,
--   },
--   config = function(_, opts)
--     require("tokyonight").setup(opts)
--     vim.cmd("colorscheme tokyonight")
--   end,
-- }

return {
  "projekt0n/github-nvim-theme",
  name = "github-theme",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("github-theme").setup({
      options = {
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      },
    })

    vim.cmd("colorscheme github_dark")
  end,
}
