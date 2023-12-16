---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require('custom.highlights')

M.ui = {
	theme = 'nightfox',
	theme_toggle = { 'nightfox', 'one_light' },

	telescope = { style = 'bordered' },

	statusline = {
		theme = 'vscode_colored',
		separator_style = 'default',
		overriden_modules = nil,
	},
}

M.base46 = {
	integrations = {
		'blankline',
		'cmp',
		'defaults',
		'devicons',
		'git',
		'lsp',
		'mason',
		'nvchad_updater',
		'nvcheatsheet',
		'nvdash',
		'nvimtree',
		'statusline',
		'syntax',
		'tbline',
		'telescope',
		'whichkey',
		'dap',
		'hop',
		'rainbowdelimiters',
		'todo',
		'trouble',
		'notify',
	},

	hl_override = highlights.override,
	hl_add = highlights.add,
}

M.plugins = 'custom.plugins'

-- check core.mappings for table structure
M.mappings = require('custom.mappings')

return M
