-- Enhanced key binding display
return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>q"] = { name = "+session" },
        ["<leader>u"] = { name = "+undo" },
      },
    },
  },
}