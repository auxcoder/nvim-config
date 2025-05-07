local lsp = vim.g.lazyvim_php_lsp or "intelephense"

return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- add longer timeout, since formatting blade files gets a little slow
      format = { timeout_ms = 2000 },
      servers = {
        -- php
        phpactor = {
          enabled = lsp == "phpactor",
        },
        intelephense = {
          enabled = lsp == "intelephense",
          settings = {
            intelephense = {
              environment = {
                phpVersion = "8.3", -- or "8.2"
              },
              filetypes = { "php", "blade", "php_only" },
              files = {
                associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
                maxSize = 5000000,
              },
              -- format = {
              --   braces = "k&r",
              -- },
            },
          },
        },
        -- markdown
        marksman = {
          -- Optional but recommended: help marksman detect project roots
          root_dir = require("lspconfig.util").root_pattern(".git", ".marksman.toml", ".editorconfig"),
        },
        -- Add this for Lua:
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" }, -- <-- fix: allow 'vim' as a global
              },
            },
          },
        },
        -- automatically installed with mason and loaded with lspconfig
        -- pyright = {},
        -- groovyls = {},
        [lsp] = {
          enabled = true,
        },
      },
      autoformat = true,
    },
  },
}
