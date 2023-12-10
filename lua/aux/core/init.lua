local g = vim.g
if g.vscode ~= nil then
	return require('aux.core.vscode')
end
require('aux.core.keymaps')
require('aux.core.options')
