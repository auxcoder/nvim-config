return {
  -- Treesitter: embedded_template parser for ERB highlighting/folding
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "ruby", "embedded_template" } },
  },
  -- Herb Language Server: HTML-aware diagnostics for ERB files
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        herb_ls = {
          filetypes = { "eruby" },
        },
      },
    },
  },
  -- Mason: ensure herb-ls is installed
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "herb-language-server" } },
  },
}
