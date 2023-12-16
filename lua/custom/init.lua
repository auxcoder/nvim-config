vim.g.lua_snippets_path = vim.fn.stdpath('config') .. '/lua/custom/snippets'

if vim.g.vscode ~= nil then
	return require('custom.vscode')
end

-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
