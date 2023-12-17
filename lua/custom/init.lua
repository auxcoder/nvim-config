vim.g.lua_snippets_path = vim.fn.stdpath('config') .. '/lua/custom/snippets'

if vim.g.vscode ~= nil then
	return require('custom.vscode')
end

-- load autocmd's
require('custom.utils.autocmd')
require('custom.utils.usercmd')
