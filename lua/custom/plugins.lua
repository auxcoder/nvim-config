local overrides = require('custom.configs.overrides')

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		'neovim/nvim-lspconfig',
		dependencies = {
			-- format & linting
			{
				'jose-elias-alvarez/null-ls.nvim',
				config = function()
					require('custom.configs.null-ls')
				end,
			},
		},
		config = function()
			require('plugins.configs.lspconfig')
			require('custom.configs.lspconfig')
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		'williamboman/mason.nvim',
		opts = overrides.mason,
	},

	{
		'nvim-treesitter/nvim-treesitter',
		opts = overrides.treesitter,
	},

	{
		'nvim-tree/nvim-tree.lua',
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		'max397574/better-escape.nvim',
		event = 'InsertEnter',
		config = function()
			require('better_escape').setup()
		end,
	},

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
	{
		'NvChad/nvcommunity',
		{ import = 'nvcommunity.git.diffview' },
		{ import = 'nvcommunity.git.neogit' },
	},
	{
		'ThePrimeagen/harpoon',
		branch = 'harpoon2',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		cmd = 'Harpoon',
		config = function()
			require('harpoon'):setup()
		end,
	},
	{
		'sindrets/diffview.nvim',
		event = 'BufRead',
		config = function()
			require('diffview').setup({
				enhanced_diff_hl = true,
				view = {
					merge_tool = {
						layout = 'diff3_mixed',
					},
				},
			})
		end,
	},
	{
		'rhysd/git-messenger.vim',
		config = function()
			vim.g.git_messenger_floating_win_opts = { border = 'single' }
			vim.g.git_messenger_popup_content_margins = false
		end,
	},
	{
		'folke/todo-comments.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		event = 'BufReadPost',
		config = function()
			require('custom.configs.todo')
		end,
	},
	{
		'preservim/tagbar',
		config = function()
			-- set keymaps
			vim.keymap.set('n', '<F8>', ':TagbarToggle<CR>', { desc = 'Toggle Ctags sidebar' })
		end,
	},
	-- -@type NvPluginSpec
	{
		'kevinhwang91/nvim-ufo',
		event = 'VimEnter',
		init = function()
			vim.o.foldcolumn = 'auto'
			vim.o.foldlevel = 99 -- Using ufo provider need a large value
			vim.o.foldlevelstart = 99
			vim.o.foldnestmax = 0
			vim.o.foldenable = true
			vim.o.foldmethod = 'indent'

			vim.opt.fillchars = {
				fold = ' ',
				foldopen = '',
				foldsep = ' ',
				foldclose = '',
				stl = ' ',
				eob = ' ',
			}
		end,
		dependencies = {
			'kevinhwang91/promise-async',
			{
				'luukvbaal/statuscol.nvim',
				opts = function()
					local builtin = require('statuscol.builtin')
					return {
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
							'dashboard',
							'neo-tree',
							'Trouble',
							'noice',
							'lazy',
							'toggleterm',
						},
						segments = {
							-- Segment: Add padding
							{
								text = { ' ' },
							},
							-- Segment: Fold Column
							{
								text = { builtin.foldfunc },
								click = 'v:lua.ScFa',
								maxwidth = 1,
								colwidth = 1,
								auto = false,
							},
							-- Segment: Add padding
							{
								text = { ' ' },
							},
							-- Segment : Show signs with one character width
							{
								sign = {
									name = { '.*' },
									maxwidth = 1,
									colwidth = 1,
								},
								auto = true,
								click = 'v:lua.ScSa',
							},
							-- Segment: Show line number
							{
								text = { ' ', ' ', builtin.lnumfunc, ' ' },
								click = 'v:lua.ScLa',
								condition = { true, builtin.not_empty },
							},
							-- Segment: GitSigns exclusive
							{
								sign = {
									namespace = { 'gitsign.*' },
									maxwidth = 1,
									colwidth = 1,
									auto = false,
								},
								click = 'v:lua.ScSa',
							},
							-- Segment: Add padding
							{
								text = { ' ' },
								hl = 'Normal',
								condition = { true, builtin.not_empty },
							},
						},
					}
				end,
			},
		},
		opts = {
			close_fold_kinds = { 'imports' },
			provider_selector = function()
				return { 'treesitter', 'indent' }
			end,
		},
	},
}

return plugins
