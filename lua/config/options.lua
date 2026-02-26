-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set to "intelephense" to use intelephense instead of phpactor.
vim.g.lazyvim_php_lsp = "intelephense"

-- Reduce LSP logging to prevent huge log files
vim.lsp.set_log_level("WARN") -- or "ERROR" for even less logging

-- mini-snippets
vim.g.lazyvim_mini_snippets_in_completion = true

local opt = vim.opt

opt.listchars = {
  tab = "> ",
  trail = "<", -- default " "
  nbsp = "+",
}

-- automatically wrap long lines
opt.wrap = true

-- Backup and undo settings
opt.backup = false -- Don't create backup files
opt.writebackup = true -- Create temporary backup during write
opt.undofile = true -- Enable persistent undo
opt.undodir = vim.fn.stdpath("data") .. "/undodir" -- Set undo directory
opt.swapfile = true -- Keep swap files for crash recovery

-- Spell checking settings
opt.spell = false -- Disable by default, enable per filetype
opt.spelllang = { "en_us" } -- Default language for spell checking
