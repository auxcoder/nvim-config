-- github
-- return {
--   "projekt0n/github-nvim-theme",
--   name = "github-theme",
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require("github-theme").setup({
--       options = {
--         styles = {
--           comments = "italic",
--           keywords = "bold",
--           types = "italic,bold",
--         },
--       },
--     })
--
--     vim.cmd("colorscheme github_dark_dimmed")
--   end,
-- }

-- catppuccin
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = false,
      color_overrides = {
        all = {
          -- https://github.com/catppuccin/catppuccin/blob/main/docs/style-guide.md
          -- Background Colors
          base = "#22272e", -- GitHub Dark Dimmed Background
          -- Secondary Panes
          crust = "#2d333b", -- Slightly lighter
          mantle = "#1c2128", -- Slightly darker
          -- Typography
          -- rosewater = "#f5e0dc", -- (Optional) Muted white
          -- green = "#4a9339", -- css class names in httml
          mauve = "#89b4fa", -- Purple -> Bright Blue
          pink = "#94e2d5", -- Pink -> Teal
          -- flamingo = "#89dceb", -- Rose -> Sky Blue
          red = "#f47067", -- Muted Salmon (Standard GH error color, low red-light)
        },
      },
      custom_highlights = function(colors)
        return {
          -- 1. The 'function' keyword (e.g., "local function")
          -- ["@keyword.function"] = { fg = colors.sky, style = { "italic" } },
          -- 2. The function name (e.g., "my_function_name")
          ["@function"] = { fg = colors.lavender, style = { "bold" } },
          -- Optional: Function calls (invoking the function later)
          ["@function.call"] = { fg = colors.teal },
          -- Bufferline: Strong contrast between active and inactive
          BufferLineBufferSelected = { fg = colors.text, bg = colors.base, style = { "bold", "italic" } },
          BufferLineIndicatorSelected = { fg = colors.mauve, bg = colors.base },
          BufferLineBuffer = { fg = colors.surface2, bg = colors.crust },
        }
      end,
      term_colors = true,
      auto_integrations = true,
      -- integrations = {
      --   telescope = { enabled = true },
      --   treesitter = true,
      --   gitsigns = true,
      --   nvimtree = true,
      --   notify = true,
      --   mini = true,
      --   which_key = true,
      --   blink_cmp = {
      --     style = "bordered",
      --   },
      --   blink_indent = true,
      --   dashboard = true,
      -- },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
