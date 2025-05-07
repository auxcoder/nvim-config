return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      -- Update to the new format as suggested by which-key health check
      defaults = {
        { "<leader>q", group = "session", mode = { "n" } },
      },
    },
  },
}
