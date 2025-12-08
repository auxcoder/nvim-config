return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- Ensure highlighting is still enabled
    highlight = { enable = true },
    indent = {
      enable = true,
      disable = { "php" },
    },
    ensure_installed = {
      "php",
      "blade",
      "html",
      "javascript",
      "css",
    },
  },
}
