return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
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
        "groovy",
      },
    },
  },
}
