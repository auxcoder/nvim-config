return {
	'nvim-tree/nvim-tree.lua',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	event = 'CursorHold',
	config = function()
		local nvimtree = require('nvim-tree')

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- change color for arrows in tree to light blue
		vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
		vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

		-- configure nvim-tree
		nvimtree.setup({
			diagnostics = { enable = true },
			update_focused_file = { enable = true },
			hijack_directories = { enable = true },
			filters = { custom = { '.DS_Store', '.git$', 'node_modules$', '^target$' } },
			git = { ignore = false },
			view = {
				width = 35,
				side = 'left',
				number = false,
				-- mappings = {
				-- 	list = {
				-- 		{ key = 'l', action = 'edit' },
				-- 		{ key = 'o', action = 'edit' },
				-- 		{ key = '<cr>', action = 'edit' },
				-- 		{ key = 'I', action = 'toggle_ignored' },
				-- 		{ key = 'H', action = 'toggle_dotfiles' },
				-- 		{ key = 'R', action = 'refresh' },
				-- 		{ key = '=', action = 'preview' },
				-- 		{ key = 'X', action = 'system_open' },
				-- 		{ key = '?', action = 'toggle_help' },
				-- 	},
				-- },
			},
			-- change folder arrow icons
			renderer = {
				group_empty = true,
				highlight_opened_files = 'name',
				highlight_git = true,
				indent_markers = {
					enable = true,
				},
				icons = {
					git_placement = 'after',
					show = {
						git = true,
						-- folder = false,
						file = true,
						-- folder_arrow = false,
					},
					glyphs = {
						default = '',
						git = {
							unstaged = '~',
							staged = '+',
							unmerged = '!',
							renamed = '≈',
							untracked = '?',
							deleted = 'x',
						},
						-- folder = {
						-- 	arrow_closed = '', -- arrow when folder is closed
						-- 	arrow_open = '', -- arrow when folder is open
						-- },
					},
				},
			},
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					-- window_picker = { enable = false, }, -- disable window_picker for
					window_picker = {
						exclude = {
							filetype = {
								'packer',
								'qf',
								'Trouble',
							},
							buftype = {
								'terminal',
								'help',
							},
						},
					},
				},
			},
		})

		-- set keymaps
		local k = vim.keymap -- for conciseness
		local api = require('nvim-tree.api')
		k.set('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' }) -- toggle file explorer
		k.set('n', '<leader>ef', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle file explorer on current file' }) -- toggle file explorer on current file
		k.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' }) -- collapse file explorer
		k.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' }) -- refresh file explorer
		k.set('n', '?', api.tree.toggle_help, { desc = 'Help' }) -- refresh file explorer

		-- autocmd configuration to disable line wrapping when editing files of type 'NvimTree'
		local a = vim.api -- for conciseness
		a.nvim_create_autocmd('FileType', {
			group = a.nvim_create_augroup('NVIM_TREE', { clear = true }),
			pattern = 'NvimTree',
			callback = function()
				a.nvim_win_set_option(0, 'wrap', false)
			end,
		})
	end,
}
