# Readme

- [Readme](#readme)
	- [Tutorials](#tutorials)
	- [Keymap](#keymap)
		- [Nerd Fonts](#nerd-fonts)
	- [Plugins](#plugins)
		- [AlphaNvim](#alphanvim)
		- [AutoSession](#autosession)
		- [BufferLine](#bufferline)
		- [Colorizer](#colorizer)
		- [ColorScheme](#colorscheme)
		- [Comment](#comment)
		- [DiffView](#diffview)
		- [Dressing](#dressing)
		- [Formatting](#formatting)
		- [GitMessenger](#gitmessenger)
		- [GitSigns](#gitsigns)
		- [Harpoon](#harpoon)
		- [IndentBlankLine](#indentblankline)
		- [linting](#linting)
		- [LuaLine](#lualine)
		- [LuaSnip](#luasnip)
		- [NvimAutoPairs](#nvimautopairs)
		- [NvimCmp](#nvimcmp)
		- [NvimSurround](#nvimsurround)
		- [NvimTree](#nvimtree)
		- [NvimTreesitterTextObjects](#nvimtreesittertextobjects)
		- [NvimTreesitter](#nvimtreesitter)
		- [NvimTsContextCommentstring](#nvimtscontextcommentstring)
		- [NvimWebDevicons](#nvimwebdevicons)
		- [Tagbar](#tagbar)
		- [Targets](#targets)
		- [Telescope](#telescope)
		- [VimCommentary](#vimcommentary)
		- [VimMaximizer](#vimmaximizer)
		- [VimSurround](#vimsurround)
		- [WhichKey](#whichkey)
		- [TagBar](#tagbar-1)
		- [DiffView](#diffview-1)
			- [Minimal Usage](#minimal-usage)
	- [Todo](#todo)
	- [NERDTree](#nerdtree)

Based on

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

## Plugins

### AlphaNvim
### AutoSession
### BufferLine
### Colorizer
### ColorScheme
### Comment
### DiffView
### Dressing
### Formatting
### GitMessenger
### GitSigns
### Harpoon
### IndentBlankLine
### linting
### LuaLine
### LuaSnip
### NvimAutoPairs
### NvimCmp
### NvimSurround
### NvimTree
### NvimTreesitterTextObjects
### NvimTreesitter
### NvimTsContextCommentstring
### NvimWebDevicons
### Tagbar
### Targets
### Telescope
### VimCommentary
### VimMaximizer
### VimSurround
### WhichKey

### TagBar

Requires installing Ctags

```sh
brew install ctags
```

### DiffView

- <https://github.com/sindrets/diffview.nvim>
- [DiffView Youtube](https://www.youtube.com/watch?v=SWldGqw9wkc)

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
