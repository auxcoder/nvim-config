-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader>gd", function()
  Util.terminal({ "lazydocker", "-f", Util.root() .. "docker-compose.yml" }, { cwd = Util.root(), esc_esc = false })
end, { desc = "LazyDocker (root dir)" })

-- Perusing code faster with K and J
vim.keymap.set({ "n", "v" }, "K", "5k", { noremap = true, desc = "Up faster" })
vim.keymap.set({ "n", "v" }, "J", "5j", { noremap = true, desc = "Down faster" })

-- Save file
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { noremap = true, desc = "Save window" })

-- Convert selected text to snake_case and lowercase
vim.api.nvim_set_keymap("x", "<leader>s", [[:s/\%V\s\+/_/g<CR>gvgu]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>s", [[viw:s/\s\+/_/g<CR>viwgu]], { noremap = true, silent = true })
