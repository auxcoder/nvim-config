local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.api.nvim_command
local augroup = vim.api.nvim_create_augroup
local settings = require('custom.chadrc').settings
local fn = vim.fn

autocmd('VimResized', {
	desc = 'Auto resize panes when resizing nvim window',
	pattern = '*',
	command = 'tabdo wincmd =',
})
