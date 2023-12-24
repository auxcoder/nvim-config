---@type MappingsTable
local M = {}

-- <C> -> Ctrl, <leader> -> Space, <A> -> alt, <S> -> shift

M.general = {
	n = {
		[';'] = { ':', 'enter command mode', opts = { nowait = true } },
		['dd'] = { '_dd' },
		['<C-c>'] = { 'Esc' },
		['<C-a>'] = { 'ggVG' },
	},
	v = {
		['J'] = { ":m '>+1<CR>gv=gv" },
		['K'] = { ":m '<-2<CR>gv=gv" },
		['d'] = { '_d' },
		['>'] = { '>gv', 'indent' },
	},
}

M.text = {
	n = {
		['x'] = { '"_x' },
	},
	i = {
		-- Move line up and down
		['<C-Up>'] = { '<CMD>m .-2<CR>==', '󰜸 Move line up' },
		['<C-Down>'] = { '<CMD>m .+1<CR>==', '󰜯 Move line down' },

		-- Navigate
		['<A-Left>'] = { '<ESC>I', ' Move to beginning of line' },
		['<A-Right>'] = { '<ESC>A', ' Move to end of line' },
	},
}

M.harpoon = {
	n = {
		['<C-m>'] = {
			function()
				require('harpoon'):list():append()
			end,
			'Harpoon mark file',
		},
		['<C-t>'] = {
			function()
				require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
			end,
			'Harpoon toggle list',
		},
	},
}

M.tagbar = {
	n = {
		['<F8>'] = { ':TagbarToggle<CR>', 'Toggle Ctags sidebar' },
	},
	i = {
		['<F8>'] = { ':TagbarToggle<CR>', 'Toggle Ctags sidebar' },
	},
}

return M
