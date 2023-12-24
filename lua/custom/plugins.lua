local overrides = require('custom.configs.overrides')

---@type NvPluginSpec[]
local plugins = {
	-- Override plugin definition options
	-- lsp defaults & configs
	{
		'neovim/nvim-lspconfig',
		config = function()
			require('plugins.configs.lspconfig')
			require('custom.configs.lspconfig')
		end,
	},
	{
		'nvimtools/none-ls.nvim',
		event = 'VeryLazy',
		opts = function()
			return require('custom.configs.null-ls')
		end,
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
	-- better ux
	-- SCP
	{
		'max397574/better-escape.nvim',
		event = 'InsertEnter',
		config = function()
			require('better_escape').setup()
		end,
	},
	{
		'yamatsum/nvim-cursorline',
		config = function()
			require('custom.configs.cursorline')
		end,
	},
	{ 'itchyny/vim-cursorword' },
	-- web
	{
		'razak17/tailwind-fold.nvim',
		opts = {
			min_chars = 3, -- min chars to fold.
		},
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		ft = { 'html', 'svelte', 'astro', 'vue', 'typescriptreact' },
	},
	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
	-- version control
	-- git conflicts
	{
		'akinsho/git-conflict.nvim',
		version = '*',
		ft = 'gitcommit',
		config = true,
	},
	--
	{
		'tpope/vim-fugitive',
		keys = {
			{ '<leader>gs', '<cmd>vertical Git <cr>', desc = '[G]it [s]tatus' },
			{ '<leader>gc', '<cmd>Git commit --quiet<cr>', desc = '[G]it [s]tatus' },
			{ '<leader>gfp', '<cmd>Git push<cr>', desc = '[G]it [p]ush' },
			{ '<leader>gfP', '<cmd>Git pull<cr>', desc = '[G]it [P]ull' },
		},
	},
	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- community configs: https://github.com/NvChad/nvcommunity
	{
		'NvChad/nvcommunity',
		{ import = 'nvcommunity.lsp.dim' },
		-- { import = 'nvcommunity.git.diffview' },
		-- { import = 'nvcommunity.git.neogit' },
	},
	-- simple file bookmark
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
	-- git diff
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
	-- highlight todo:, fixme:, etc
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

	-- doc tree
	{
		'preservim/tagbar',
		cmd = 'TagbarToggle',
		config = function() end,
	},

	{
		'kevinhwang91/nvim-ufo',
		event = 'VeryLazy',
		init = function()
			vim.o.foldcolumn = '1'
			vim.o.foldlevel = 99 -- Using ufo provider need a large value
			vim.o.foldlevelstart = 99
			vim.o.foldnestmax = 0
			vim.o.foldenable = true
			vim.o.foldmethod = 'indent'
			-- vim.o.fillchars = [[eob: slt: ,fold: ,foldopen:,foldsep: ,foldclose:]]
		end,
		dependencies = {
			'kevinhwang91/promise-async',
			{
				'luukvbaal/statuscol.nvim',
				opts = function()
					require('custom.configs.statuscol')
				end,
			},
		},
		opts = function()
			require('custom.configs.ufo')
		end,
	},
	-- show diagnostics, references, telescope results
	{
		'folke/trouble.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		cmd = { 'Trouble', 'TroubleToggle', 'TodoTrouble' },
		opts = {},
		init = function()
			require('custom.configs.trouble')
		end,
	},
	--  split/join blocks of code
	{
		{
			'Wansmer/treesj',
			keys = { '<space>m', '<space>j', '<space>s' },
			dependencies = { 'nvim-treesitter/nvim-treesitter' },
			config = function()
				require('custom.configs.treesj')
			end,
		},
	},
	-- a tree like view for symbols
	{
		'simrat39/symbols-outline.nvim',
		cmd = 'SymbolsOutline',
		config = function()
			require('custom.configs.symbols')
		end,
		-- config = true,
	},
	-- markdown preview
	{
		'iamcco/markdown-preview.nvim',
		cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
		ft = { 'markdown' },
		build = function()
			vim.fn['mkdp#util#install']()
		end,
	},
}

return plugins
