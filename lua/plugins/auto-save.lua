return {
  {
    "pocco81/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      enabled = true,
      execution_message = {
        message = function()
          return "" -- Silent auto-save
        end,
      },
      trigger_events = { "InsertLeave", "TextChanged" },
      -- Don't auto-save in these conditions
      condition = function(buf)
        local utils = require("auto-save.utils.data")

        -- Don't save for certain file types
        if vim.tbl_contains({ "TelescopePrompt", "gitcommit", "gitrebase" }, vim.bo[buf].filetype) then
          return false
        end

        -- Don't save if buffer is modified by an external command
        if vim.bo[buf].modified and utils.not_in(vim.fn.expand("%:t"), { "plugins.lua" }) then
          return true
        end

        return false
      end,
      write_all_buffers = false,
      debounce_delay = 135,
    },
  },
}
