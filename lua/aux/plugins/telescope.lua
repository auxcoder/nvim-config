return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-file-browser.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		'nvim-tree/nvim-web-devicons',
	},
	event = 'CursorHold',
	config = function()
		local telescope = require('telescope')
		local actions = require('telescope.actions')

		telescope.setup({
			defaults = {
				prompt_prefix = ' ❯ ',
				initial_mode = 'insert',
				layout_config = {
					prompt_position = 'top',
				},
				path_display = { 'shorten' }, -- { 'smart', 'truncate', 'shorten' }
				mappings = {
					i = {
						['<ESC>'] = actions.close,
						['<TAB>'] = actions.toggle_selection + actions.move_selection_next,

						['<C-k>'] = actions.move_selection_previous, -- move to prev result
						['<C-j>'] = actions.move_selection_next, -- move to next result

						['<C-s>'] = actions.send_selected_to_qflist,
						['<C-q>'] = actions.send_to_qflist,
						-- ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist, -- send to quick fix list
					},
					n = {
						['<esc>'] = actions.close,

						['<PageUp>'] = actions.results_scrolling_up,
						['<PageDown>'] = actions.results_scrolling_down,

						['?'] = actions.which_key,
					},
				},
			},
			pickers = {},
			extensions = {
				file_browser = {
					-- theme = 'ivy',
					-- disables netrw and use telescope-file-browser in its place
					-- hijack_netrw = true, -- opens on init
					mappings = {
						['i'] = {
							-- your custom insert mode mappings
						},
						['n'] = {
							-- your custom normal mode mappings
						},
					},
				},
			},
		})

		telescope.load_extension('fzf')
		telescope.load_extension('file_browser')

		-- set keymaps
		local k = vim.keymap -- for conciseness
		k.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Fuzzy find files in cwd' })
		k.set('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', { desc = 'Fuzzy find recent files' })
		k.set('n', '<leader>fs', '<cmd>Telescope live_grep<CR>', { desc = 'Find string in cwd' })
		k.set('n', '<leader>fg', '<cmd>Telescope grep_string<CR>', { desc = 'Find string under cursor in cwd' })
		k.set('n', '<leader>fb', '<cmd>Telescope file_browser<CR>', { desc = 'Find files under in cwd' })
		k.set(
			'n',
			'<leader>fd',
			'<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>',
			{ desc = 'Find dirs under in cwd' }
		)
		-- local Telescope = setmetatable({}, {
		-- 	__index = function(_, k)
		-- 		if vim.bo.filetype == 'NvimTree' then
		-- 			vim.cmd.wincmd('l')
		-- 		end
		-- 		return finders[k]
		-- 	end,
		-- })
		-- k.set('n', "'b", Telescope.buffers) -- Fuzzy find active buffers
		-- k.set('n', "'r", Telescope.live_grep) -- Search for string
		-- k.set('n', "'c", Telescope.git_status) -- Fuzzy find changed files in git
	end,
}
