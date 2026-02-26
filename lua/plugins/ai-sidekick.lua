return {
  "folke/sidekick.nvim",
  opts = {
    copilot = {
      enabled = false,
    },
    cli = {
      tools = {
        kiro = {
          cmd = { "kiro-cli", "chat" },
        },
      },
    },
  },
  keys = {
    {
      "<tab>",
      function()
        -- if there is a next edit, jump to it, otherwise apply it if any
        if not require("sidekick").nes_jump_or_apply() then
          return "<Tab>" -- fallback to normal tab
        end
      end,
      expr = true,
      desc = "Goto/Apply Next Edit Suggestion",
    },
    {
      "<c-.>",
      function()
        require("sidekick.cli").toggle()
      end,
      desc = "Sidekick Toggle",
      mode = { "n", "t", "i", "x" },
    },
    {
      "<leader>aa",
      function()
        require("sidekick.cli").toggle()
      end,
      desc = "Sidekick Toggle CLI",
    },
    {
      "<leader>as",
      function()
        require("sidekick.cli").select()
      end,
      -- Or to select only installed tools:
      -- require("sidekick.cli").select({ filter = { installed = true } })
      desc = "Select CLI",
    },
    {
      "<leader>ad",
      function()
        require("sidekick.cli").close()
      end,
      desc = "Detach a CLI Session",
    },
    {
      "<leader>at",
      function()
        require("sidekick.cli").send({ msg = "{this}" })
      end,
      mode = { "x", "n" },
      desc = "Send This",
    },
    {
      "<leader>af",
      function()
        require("sidekick.cli").send({ msg = "{file}" })
      end,
      desc = "Send File",
    },
    {
      "<leader>av",
      function()
        require("sidekick.cli").send({ msg = "{selection}" })
      end,
      mode = { "x" },
      desc = "Send Visual Selection",
    },
    {
      "<leader>ap",
      function()
        require("sidekick.cli").prompt()
      end,
      mode = { "n", "x" },
      desc = "Sidekick Select Prompt",
    },
    -- Send diagnostics/errors
    {
      "<leader>ae",
      function()
        local diagnostics = vim.diagnostic.get(0)
        if #diagnostics == 0 then
          vim.notify("No diagnostics in current buffer", vim.log.levels.INFO)
          return
        end
        local msg = "Diagnostics in " .. vim.fn.expand("%:p") .. ":\n\n"
        for _, d in ipairs(diagnostics) do
          msg = msg .. string.format("Line %d: [%s] %s\n", d.lnum + 1, d.severity, d.message)
        end
        require("sidekick.cli").send({ msg = msg })
      end,
      desc = "Send Diagnostics",
    },
    -- Send git diff
    {
      "<leader>ag",
      function()
        local diff = vim.fn.system("git diff " .. vim.fn.expand("%:p"))
        if diff == "" then
          vim.notify("No changes in current file", vim.log.levels.INFO)
          return
        end
        require("sidekick.cli").send({
          msg = "Git diff for " .. vim.fn.expand("%:p") .. ":\n\n```diff\n" .. diff .. "```",
        })
      end,
      desc = "Send Git Diff",
    },
    -- Send current function/class
    {
      "<leader>au",
      function()
        require("sidekick.cli").send({ msg = "{this}" })
      end,
      desc = "Send Current Function/Class",
    },
    -- Quick prompts
    {
      "<leader>ax",
      function()
        require("sidekick.cli").send({ msg = "{selection}\n\nExplain this code" })
      end,
      mode = { "x" },
      desc = "Explain Selection",
    },
    {
      "<leader>ar",
      function()
        require("sidekick.cli").send({ msg = "{selection}\n\nRefactor this code" })
      end,
      mode = { "x" },
      desc = "Refactor Selection",
    },
    {
      "<leader>aw",
      function()
        require("sidekick.cli").send({ msg = "{selection}\n\nWrite tests for this code" })
      end,
      mode = { "x" },
      desc = "Write Tests",
    },
    -- Open kiro directly
    {
      "<leader>ak",
      function()
        require("sidekick.cli").toggle({ name = "kiro", focus = true })
      end,
      desc = "Toggle Kiro",
    },
  },
}
