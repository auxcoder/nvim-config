-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

-------------------------------------------------------------------------------
-- # General & Navigation
-------------------------------------------------------------------------------

-- Perusing code faster with K and J
map({ "n", "v" }, "K", "5k", { desc = "Up faster" })
map({ "n", "v" }, "J", "5j", { desc = "Down faster" })
map({ "n", "v" }, ",", "^", { desc = "Start of line" })

-- Quickfix list navigation
map("n", "<M-j>", "<cmd>cnext<CR>", { desc = "Next Quickfix" })
map("n", "<M-k>", "<cmd>cprev<CR>", { desc = "Prev Quickfix" })

-- Tools
map("n", "<leader>gd", function()
  LazyVim.terminal({ "lazydocker" }, { cwd = LazyVim.root() })
end, { desc = "LazyDocker" })

-------------------------------------------------------------------------------
-- # Text Manipulation
-------------------------------------------------------------------------------

-- Convert selection/word to snake_case and lowercase
map("x", "<leader>s", [[:s/\%V\s\+/_/g<CR>gvgu]], { desc = "Snake Case Selection" })
map("n", "<leader>s", [[viw:s/\s\+/_/g<CR>viwgu]], { desc = "Snake Case Word" })

-------------------------------------------------------------------------------
-- # most used actions
-------------------------------------------------------------------------------

map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Undotree" })
-- M -> Alt key
map("n", "<M-j>", "<cmd>cnext<cr>", { desc = "Next Quickfix buffer" })
map("n", "<M-k>", "<cmd>cprev<cr>", { desc = "Next Quickfix buffer" })

-- Custom keymap to launch kiro-cli in a floating terminal
vim.keymap.set("n", "<leader>gk", function()
  Snacks.terminal("kiro-cli", {
    cwd = LazyVim.root(),
    interactive = true,
  })
end, { desc = "Kiro CLI (Terminal)" })

-- Kiro Personal
-- vim.keymap.set("n", "<leader>kp", function()
--   Snacks.terminal("kiro-cli chat", {
--     env = { KIRO_CONFIG_DIR = vim.fn.expand("~/.kiro-personal") },
--     desc = "Kiro Personal Chat",
--   })
-- end)

-- Kiro Work
-- vim.keymap.set("n", "<leader>kw", function()
--   Snacks.terminal("kiro-cli chat", {
--     env = { KIRO_CONFIG_DIR = vim.fn.expand("~/.kiro-work") },
--     desc = "Kiro Work Chat",
--   })
-- end)
-------------------------------------------------------------------------------
-- # Fake Data Generation (Native Snippets)
-- https://github.com/tkhren/vim-fake
-------------------------------------------------------------------------------

local function insert_fake(type)
  local data = vim.fn["fake#gen"](type)
  vim.snippet.expand(data)
end

local function fake(type)
  return function()
    insert_fake(type)
  end
end

-- Triggers (Normal & Insert mode)
local modes = { "n", "i" }

map(modes, "<leader>fkn", fake("male_name"), { desc = "Name" })
map(modes, "<leader>fke", fake("email"), { desc = "Email" })
map(modes, "<leader>fkj", fake("job"), { desc = "Job" })
map(modes, "<leader>fkc", fake("city"), { desc = "City" })
map(modes, "<leader>fkl", fake("nonsense"), { desc = "Loren" })
map(modes, "<leader>fkw", fake("word"), { desc = "Word" })
map(modes, "<leader>fkw", fake("paragraph"), { desc = "Paragraph" })

map(modes, "<leader>fkh", function()
  local name = vim.fn["fake#gen"]("male_name")
  -- Classes sorted: bg- border- p- rounded-
  local html = string.format('<div class="bg-white border p-4 rounded-lg">\n  %s\n</div>', name)
  vim.snippet.expand(html)
end, { desc = "HTML Card" })
