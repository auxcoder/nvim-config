return {
  "nickjvandyke/opencode.nvim",
  -- "main" supports OpenCode v2 (you have v2.0.20). Pin to a release with version = "*" for v1.
  version = false,
  dependencies = {
    -- Optional but recommended: enhances Ask (input) and Select (picker).
    { "folke/snacks.nvim" },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Uses defaults. opencode.nvim auto-discovers a running `opencode` server,
      -- and otherwise starts one in a terminal.
    }

    -- autoread is required so buffers reload when OpenCode edits files on disk.
    vim.o.autoread = true

    local opencode = require("opencode")

    -- Keymaps under the <leader>o prefix to avoid clashing with sidekick.nvim (<leader>a, <C-.>)
    -- and Vim's <C-a>/<C-x> increment/decrement.
    -- stylua: ignore start
    vim.keymap.set({ "n", "x" }, "<leader>oa", function() opencode.ask("@this: ") end, { desc = "Ask OpenCode about this" })
    vim.keymap.set({ "n", "x" }, "<leader>oA", function() opencode.ask() end, { desc = "Ask OpenCode" })
    vim.keymap.set({ "n", "x" }, "<leader>os", function() opencode.select() end, { desc = "Select OpenCode action" })
    vim.keymap.set({ "n", "x" }, "<leader>op", function() opencode.prompt() end, { desc = "Prompt OpenCode" })
    vim.keymap.set({ "n", "x" }, "go", function() return opencode.operator("@this") end, { expr = true, desc = "Send range to OpenCode" })
    vim.keymap.set("n", "goo", function() return opencode.operator("@this") .. "_" end, { expr = true, desc = "Send line to OpenCode" })

    -- Built-in prompts (see :help opencode or README): explain / fix / review / test / optimize
    vim.keymap.set({ "n", "x" }, "<leader>oe", function() opencode.prompt("Explain @this and its context") end, { desc = "Explain this" })
    vim.keymap.set({ "n", "x" }, "<leader>of", function() opencode.prompt("Fix @diagnostics") end, { desc = "Fix diagnostics" })
    vim.keymap.set({ "n", "x" }, "<leader>or", function() opencode.prompt("Review @this for correctness and readability") end, { desc = "Review this" })
    vim.keymap.set({ "n", "x" }, "<leader>ot", function() opencode.prompt("Add tests for @this") end, { desc = "Add tests for this" })
    -- stylua: ignore end

    -- Register the <leader>o group name in which-key if available.
    local ok, wk = pcall(require, "which-key")
    if ok then
      wk.add({ { "<leader>o", group = "opencode" } })
    end
  end,
}
