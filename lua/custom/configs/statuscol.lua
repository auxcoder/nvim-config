-- local builtin = require "statuscol.builtin"
local present, builtin = pcall(require, 'statuscol.builtin')

if not present then
	return
end

require('statuscol').setup({
	relculright = true,
	bt_ignore = { 'nofile', 'prompt', 'terminal', 'packer' },
	ft_ignore = {
		'NvimTree',
		'dashboard',
		'nvcheatsheet',
		'dapui_watches',
		'dap-repl',
		'dapui_console',
		'dapui_stacks',
		'dapui_breakpoints',
		'dapui_scopes',
		'help',
		'vim',
		'alpha',
		'neo-tree',
		'Trouble',
		'lazy',
		'nvdash',
		'toggleterm',
	},

	segments = {
		{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
		{ text = { "%s" }, click = "v:lua.ScSa" },
		{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
	},
})
