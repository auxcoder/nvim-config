-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use ({'nvim-telescope/telescope.nvim', tag = '0.1.4', requires = {'nvim-lua/plenary.nvim'}})

	use('navarasu/onedark.nvim')                 -- Theme

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	use('nvim-treesitter/playground')

	use('theprimeagen/harpoon')                  -- Bookmark files for easy access

	use('mbbill/undotree')                       -- Manage history from any change

	use('tpope/vim-fugitive')

	use({'nvim-lualine/lualine.nvim', requires = {'nvim-tree/nvim-web-devicons', opt = true}})

	use({'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}})

	use({
		'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
		requires = {
			--- LSP servers support
			{'williamboman/mason.nvim'},             -- Mason Installer
			{"williamboman/mason-lspconfig.nvim"},   -- Mason config
			{"neovim/nvim-lspconfig"},               -- Officially supported LSP quickstart configs
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},                    -- The completion engine we'll be using for everything
			{'hrsh7th/cmp-nvim-lsp'},                -- For our complete engine, allows to use LSPs (required)
			{'hrsh7th/cmp-nvim-lsp-signature-help'},--- A helper, will auto-hint at function arguments (optional)
			{'hrsh7th/cmp-buffer'},                  -- Allows autocompletion from the buffer itself (optional)
			{'hrsh7th/cmp-path'},                    -- Helps to complete file system paths (optional)
			-- Snippets
			{'L3MON4D3/LuaSnip'},                    -- Snipperts
		}
	})
end)
