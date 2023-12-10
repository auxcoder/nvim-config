-- for conciseness
local opt = vim.opt
local g = vim.g

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
-- opt.numberwidth = 5 --  Minimal number of columns to use for the line number

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
-- opt.expandtab = true -- expand tab to spaces
-- opt.smarttab = true -- default on, a <Tab> in front of a line inserts blanks
opt.autoindent = true -- copy indent from current line when starting new one
opt.softtabstop = -1 -- If negative, shiftwidth value is used
opt.listchars = 'trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝'
-- opt.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'

-- line wrapping
opt.wrap = false -- disable line wrapping

-- Number of screen lines to keep above and below the cursor
opt.scrolloff = 8

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = 'dark' -- colorschemes that can be light or dark will be made dark
opt.signcolumn = 'yes:2' -- show sign column so that text doesn't shift

-- Decrease update time
opt.timeoutlen = 500
opt.updatetime = 200

-- Remember 50 items in commandline history
opt.history = 50

-- backspace
opt.backspace = 'indent,eol,start' -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append('unnamedplus') -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- Preserve view while jumping
opt.jumpoptions = 'view'

-- Undo and backup options
opt.backup = false
opt.writebackup = false
opt.undofile = true
-- turn off swapfile
opt.swapfile = false
-- opt.backupdir = '/tmp/'
-- opt.directory = '/tmp/'
-- opt.undodir = '/tmp/'

-- Stable buffer content on window open/close events.
-- opt.splitkeep = 'screen'

-- Improve diff
vim.opt.diffopt:append('linematch:60')

-- soft wrap
opt.wrap = true

-- WARN: this won't update the search count after pressing `n` or `N`
-- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen
-- opt.lazyredraw = true

-- Better folds (don't fold by default)
-- opt.foldmethod = 'indent'
-- opt.foldlevelstart = 99
-- opt.foldnestmax = 3
-- opt.foldminlines = 1

-- Configure git-messenger options
g.git_messenger_floating_win_opts = { border = 'single' }
g.git_messenger_popup_content_margins = false
