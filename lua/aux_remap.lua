--vim.keymap.set(<mode>, <key>, <action>, <opts>)
--:h vim.keymap.set

-- define common options
--local opts = {
--	noremap = true,      -- non-recursive
--	silent = true,       -- do not show message
--}

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>src", ":luafile $MYVIMRC<CR>")

-- copy/paste
vim.keymap.set("v", "p", '"_dP')

vim.keymap.set("i", "jj", "<Esc>", {desc = "Esc"})

vim.keymap.set("n", "Y", "y$")

vim.keymap.set("n", "<leader>e",  ":Explore<cr>", {noremap = true, silent = true})
