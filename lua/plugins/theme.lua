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
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
        color_overrides = {
          all = {
            base = "#22272e",
            crust = "#2d333b",
            mantle = "#1c2128",
            mauve = "#89b4fa",
            pink = "#94e2d5",
            red = "#f47067",
          },
        },
        custom_highlights = function(colors)
          return {
            -- 1. The 'function' keyword (e.g., "local function")
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
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
