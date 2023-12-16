# Readme

- [Readme](#readme)
	- [Tutorials](#tutorials)
	- [Keymap](#keymap)
		- [Nerd Fonts](#nerd-fonts)
	- [DefaultPlugins](#defaultplugins)
		- [nvim-lua/plenary.nvim](#nvim-luaplenarynvim)
		- [NvChad/base46](#nvchadbase46)
		- [NvChad/ui](#nvchadui)
		- [NvChad/nvterm](#nvchadnvterm)
		- [NvChad/nvim-colorizer](#nvchadnvim-colorizer)
		- [nvim-tree/nvim-web-devicons](#nvim-treenvim-web-devicons)
		- [lukas-reineke/indent-blankline.nvim](#lukas-reinekeindent-blanklinenvim)
		- [nvim-treesitter/nvim-treesitter](#nvim-treesitternvim-treesitter)
		- [lewis6991/gitsigns.nvim](#lewis6991gitsignsnvim)
		- [williamboman/mason.nvim](#williambomanmasonnvim)
		- [neovim/nvim-lspconfig](#neovimnvim-lspconfig)
		- [windwp/nvim-autopairs](#windwpnvim-autopairs)
		- [saadparwaiz1/cmp\_luasnip](#saadparwaiz1cmp_luasnip)
		- [hrsh7th/cmp-nvim-lua](#hrsh7thcmp-nvim-lua)
		- [hrsh7th/cmp-nvim-lsp](#hrsh7thcmp-nvim-lsp)
		- [hrsh7th/cmp-buffer](#hrsh7thcmp-buffer)
		- [hrsh7th/cmp-path](#hrsh7thcmp-path)
		- [numToStr/Comment.nvim](#numtostrcommentnvim)
		- [nvim-tree/nvim-tree.lua](#nvim-treenvim-treelua)
		- [nvim-telescope/telescope.nvim](#nvim-telescopetelescopenvim)
		- [folke/which-key.nvim](#folkewhich-keynvim)
	- [Extra Plugins](#extra-plugins)
		- [AlphaNvim](#alphanvim)
		- [DiffView](#diffview)
		- [Dressing](#dressing)
		- [jose-elias-alvarez/null-ls.nvim](#jose-elias-alvareznull-lsnvim)
		- [folke/todo-comments.nvim](#folketodo-commentsnvim)
		- [GitMessenger](#gitmessenger)
		- [Harpoon](#harpoon)
		- [IndentBlankLine](#indentblankline)
		- [linting](#linting)
		- [Lualine](#lualine)
		- [LuaSnip](#luasnip)
		- [NvimAutoPairs](#nvimautopairs)
		- [NvimCmp](#nvimcmp)
		- [NvimSurround](#nvimsurround)
		- [NvimTree](#nvimtree)
		- [max397574/better-escape.nvim](#max397574better-escapenvim)
		- [NvimWebDevicons](#nvimwebdevicons)
		- [NvChad/nvcommunity](#nvchadnvcommunity)
		- [sindrets/diffview.nvim](#sindretsdiffviewnvim)
		- [ThePrimeagen/harpoon](#theprimeagenharpoon)
		- [DiffView](#diffview-1)
			- [Minimal Usage](#minimal-usage)
	- [Todo](#todo)
	- [NERDTree](#nerdtree)


Based on

- [NvChad](https://github.com/NvChad/NvChad)
    - [Docs](https://nvchad.com/docs/quickstart/install)
    - [NvChad Comunity](https://github.com/NvChad/nvcommunity)
    - [BrunoKrugel/dotfiles](https://github.com/BrunoKrugel/dotfiles)
- [NumToSrt dotfiles](https://github.com/numToStr/dotfiles/tree/master/neovim/.config/nvim)
- [NeoVim config](https://github.com/josean-dev/dev-environment-files)
- [NeoVim kickstart](https://github.com/nvim-lua/kickstart.nvim/tree/master)
- [Config For The Lazy](https://www.barbarianmeetscoding.com/notes/neovim-lazyvim)

Shortcuts & Mappings

- <https://cheatography.com/marconlsantos/cheat-sheets/neovim/>

## Tutorials

- [Vim Basic Keymaps](https://www.youtube.com/watch?v=13gNtgqzzmM)
- [E03: Introduction to LuaSnip](https://www.youtube.com/watch?v=Dn800rlPIho)
- [NeoVim Lua configuration for PHP and JavaScript (WordPress, Gutenberg) development](https://marioyepes.com/blog/neovim-ide-with-lua-for-web-development/)

## Keymap

- [neovim/vim graphical cheat sheet](https://docs.google.com/spreadsheets/d/15k_UgeY0C3j8tVQnR2hD_kNljB1AApG3x3gYrKtUAlw/edit#gid=1082709605)

### Nerd Fonts

- <https://www.nerdfonts.com/font-downloads>
- <https://www.programmingfonts.org>
- <https://www.codingfont.com>

## DefaultPlugins

### nvim-lua/plenary.nvim
### NvChad/base46
### NvChad/ui
### NvChad/nvterm
### NvChad/nvim-colorizer
### nvim-tree/nvim-web-devicons
### lukas-reineke/indent-blankline.nvim
### nvim-treesitter/nvim-treesitter
### lewis6991/gitsigns.nvim
### williamboman/mason.nvim
### neovim/nvim-lspconfig
### windwp/nvim-autopairs
### saadparwaiz1/cmp_luasnip
### hrsh7th/cmp-nvim-lua
### hrsh7th/cmp-nvim-lsp
### hrsh7th/cmp-buffer
### hrsh7th/cmp-path
### numToStr/Comment.nvim
### nvim-tree/nvim-tree.lua
### nvim-telescope/telescope.nvim
### folke/which-key.nvim

## Extra Plugins

### AlphaNvim
### DiffView
### Dressing
### jose-elias-alvarez/null-ls.nvim
<!-- ### Formatting -->
### folke/todo-comments.nvim
### GitMessenger
### Harpoon
### IndentBlankLine
### linting
### Lualine
### LuaSnip
### NvimAutoPairs
### NvimCmp
### NvimSurround
### NvimTree
### max397574/better-escape.nvim
### NvimWebDevicons
### NvChad/nvcommunity
### sindrets/diffview.nvim
<!-- ### Tagbar -->
<!-- ### Targets -->
### ThePrimeagen/harpoon
<!-- ### VimMaximizer -->
<!-- ### VimSurround -->

### DiffView

- <https://github.com/sindrets/diffview.nvim>

#### Minimal Usage

```sh
:DiffviewOpen #
:DiffviewClose # Close the current DiffView. You can also use
:tabclose # Same as above
:DiffviewToggleFiles # Toggle the file panel
:DiffviewFocusFiles # Bring focus to the file panel
:DiffviewRefresh: # Update stats and entries in the file list
```

**KeyMaps**

| Mode | Keys        | Command              | Description                   |
| :--: | :---------- | :------------------- | :---------------------------- |
| `n`  | `<leader>e` | actions.focus_files  | Bring focus to the file panel |
| `n`  | `<leader>b` | actions.toggle_files | Toggle the file panel         |

## Todo

- [NvimDap](https://github.com/mfussenegger/nvim-dap)
- [Debug Adapter](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#javascript)

## NERDTree

**Creating a new file or directory in Vim using NERDTree**

- From NERDTree, navigate to the directory where you want to create the new file
- Press `m` to bring up the NERDTree Filesystem Menu. This menu allows you to `create`, `rename`, and `delete` files and directories
- Press `a` to add a child node and then simply enter the filename
- To create a directory follow the same steps but append `/` to the filename
