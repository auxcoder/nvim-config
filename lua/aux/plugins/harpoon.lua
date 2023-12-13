return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
		local k = vim.keymap
		local h = require('harpoon')

		h:setup()

		k.set('n', '<C-m>', function()
			h:list():append()
		end)

		k.set('n', '<C-n>', function()
			h.ui:nav_next()
		end)

		k.set('n', '<C-p>', function()
			h.ui:nav_prev()
		end)

		k.set('n', '<C-t>', function()
			h.ui:toggle_quick_menu(h:list())
		end)
	end,
}
