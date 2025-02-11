-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set to "intelephense" to use intelephense instead of phpactor.
vim.g.lazyvim_php_lsp = "intelephense"

local opt = vim.opt

opt.listchars = {
  tab = "> ",
  trail = "<", -- default " "
  nbsp = "+",
}

-- automatically wrap long lines
opt.wrap = true
