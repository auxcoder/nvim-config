return {
	'lewis6991/gitsigns.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local map = vim.keymap.set
		local gitsigns = require('gitsigns')

		gitsigns.setup({
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				changedelete = { text = '=' },
			},
			on_attach = function(buf)
				local gs = package.loaded.gitsigns
				local opts = { buffer = buf, expr = true, replace_keycodes = false }

				-- Navigation
				map('n', ']c', "&diff ? ']c' : '<CMD>Gitsigns next_hunk<CR>'", opts)
				map('n', '[c', "&diff ? '[c' : '<CMD>Gitsigns prev_hunk<CR>'", opts)

				-- Actions
				map({ 'n', 'v' }, '<leader>hr', gs.reset_hunk, { buffer = buf })
				map({ 'n', 'v' }, '<leader>hs', gs.stage_hunk)
				map('n', '<leader>hS', gs.stage_buffer, { buffer = buf })
				map('n', '<leader>hp', gs.preview_hunk, { buffer = buf })

				-- Text object
				map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { buffer = buf })
			end,
		})
	end,
}
