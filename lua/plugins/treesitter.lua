return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = {
    ensure_installed = { "lua", "javascript", "typescript", "json", "php", "html", "css", "kotlin" },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
