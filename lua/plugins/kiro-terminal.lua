-- Lightweight replacement for sidekick.nvim's only used feature: launching kiro-cli
-- in a terminal split. Uses snacks.terminal (bundled with LazyVim) instead of pulling
-- in sidekick just for a terminal.
return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>ak",
      function()
        require("snacks.terminal").toggle("kiro-cli chat --v3", {
          win = { position = "right", width = 0.3 },
        })
      end,
      desc = "Toggle Kiro CLI",
      mode = { "n", "t" },
    },
    {
      "<C-.>",
      function()
        require("snacks.terminal").toggle("kiro-cli chat --v3", {
          win = { position = "right", width = 0.3 },
        })
      end,
      desc = "Toggle Kiro CLI",
      mode = { "n", "t" },
    },
  },
}
