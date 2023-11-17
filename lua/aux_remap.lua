--vim.keymap.set(<mode>, <key>, <action>, <opts>)
--:h vim.keymap.set

-- define common options
-- modified from: https://github.com/neovim/nvim-lspconfig#suggested-configuration
local opts = {
	noremap = true,      -- non-recursive
	silent = true,       -- do not show message
}

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>src", ":luafile $MYVIMRC<CR>")

-- LSP Mappings + Settings -----------------------------------------------------
-- Basic diagnostic mappings, these will navigate to or display diagnostics
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- copy/paste
vim.keymap.set("v", "p", '"_dP')

vim.keymap.set("i", "jj", "<Esc>", {desc = "Esc"})

vim.keymap.set("n", "Y", "y$")

vim.keymap.set("n", "<leader>e",  ":Explore<cr>", opts)
