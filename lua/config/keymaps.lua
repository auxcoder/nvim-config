-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

map("n", "<leader>gd", function()
  LazyVim.terminal({ "lazydocker" }, { cwd = LazyVim.root() })
end, { desc = "LazyDocker" })

-- Perusing code faster with K and J
vim.keymap.set({ "n", "v" }, "K", "5k", { noremap = true, desc = "Up faster" })
vim.keymap.set({ "n", "v" }, "J", "5j", { noremap = true, desc = "Down faster" })
vim.keymap.set({ "n", "v" }, ",", "^", { noremap = true, desc = "Start of line" })

-- Quyiuckfix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", { noremap = true, desc = "Move down Quickfix list" })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", { noremap = true, desc = "Move up Quickfix list" })

--_Convert_selected_text_to_snake_case_and_lowercase
vim.api.nvim_set_keymap("x", "<leader>s", [[:s/\%V\s\+/_/g<CR>gvgu]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>s", [[viw:s/\s\+/_/g<CR>viwgu]], { noremap = true, silent = true })
