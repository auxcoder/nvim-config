return {
	'nvim-treesitter/nvim-treesitter',
	event = { 'BufReadPre', 'BufNewFile' },
	build = ':TSUpdate',
	dependencies = {
		{ 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
		{ 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' },
		{ 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require('nvim-treesitter.configs')

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = { enable = true },
			-- enable indentation
			indent = { enable = true },
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = { enable = true },
			-- ensure these language parsers are installed
			ensure_installed = {
				-- 'go',
				'json',
				'javascript',
				'typescript',
				'tsx',
				'yaml',
				'html',
				'css',
				'php',
				'prisma',
				'markdown',
				'markdown_inline',
				-- 'svelte',
				-- 'graphql',
				'bash',
				'lua',
				'vim',
				'dockerfile',
				'gitignore',
				'git_config',
				'jsdoc',
				'toml',
				'vimdoc',
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<C-space>',
					node_incremental = '<C-space>',
					scope_incremental = false,
					node_decremental = '<bs>',
				},
			},
		})
	end,
}
