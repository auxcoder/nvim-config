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
            base = "#282c33", -- #22272e -- the darkest color.
            crust = "#2f343e", -- #2d333b
            mantle = "#2f343e", -- #1c2128 -- sidebar bg -- even darker
            mauve = "#89b4fa",
            -- pink = "#94e2d5",
            red = "#f47067",
            rosewater = "#F5B8AB",
            flamingo = "#F29D9D",
            -- pink = "#AD6FF7",
            -- red = "#E66767",
            -- maroon = "#EB788B",
            -- peach = "#FAB770",
            -- yellow = "#FACA64",
            -- green = "#70CF67",
            -- teal = "#4CD4BD",
            -- sky = "#61BDFF",
            -- sapphire = "#4BA8FA",
            -- blue = "#00BFFF",
            -- lavender = "#00BBCC",
            -- text = "#C1C9E6",
            -- subtext1 = "#A3AAC2",
            -- subtext0 = "#8E94AB",
            -- overlay0 = "#89b4fa",
            -- overlay1 = "#676B80",
            -- overlay2 = "#7D8296",
            -- overlay0 = "#464957",
            -- surface2 = "#3A3D4A",
            -- surface1 = "#2F313D",
            -- surface0 = "#1D1E29",
          },
        },
        custom_highlights = function(c)
          local U = require("catppuccin.utils.colors")
          -- U.lighten(source, amount, target)
          return {
            -- 1. The 'function' keyword (e.g., "local function")
            ["@function"] = { fg = c.lavender, style = { "bold" } },
            -- Optional: Function calls (invoking the function later)
            ["@function.call"] = { fg = c.teal },
            -- Bufferline: Strong contrast between active and inactive
            BufferLineBufferSelected = { fg = c.text, bg = c.base, style = { "bold", "italic" } },
            BufferLineIndicatorSelected = { fg = c.mauve, bg = c.base },
            BufferLineBuffer = { fg = c.surface2, bg = c.crust },
            Comment = { fg = U.lighten(c.overlay0, 0.65, c.teal), style = { "italic" } },
            CmpBorder = { fg = c.surface2 },
            Cursor = { fg = c.base, bg = c.rosewater }, -- character under the cursor
            CursorLine = { bg = U.lighten(c.base, 0.80, c.mauve) }, -- Screen-line at the cursor, when 'cursorline' is set.
            FoldColumn = { fg = c.overlay0 }, -- 'foldcolumn'
            SignColumn = { fg = c.surface1 }, -- column where |signs| are displayed
            LineNr = { fg = U.lighten(c.surface1, 0.85, c.rosewater) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
            CursorLineNr = { fg = c.lavender }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line. highlights the number in numberline.
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
