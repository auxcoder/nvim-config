local lsp = vim.g.lazyvim_php_lsp or "intelephense"

return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- add longer timeout, since formatting blade files gets a little slow
      format = { timeout_ms = 2000 },
      servers = {
        -- html
        html = {
          filetypes = { "html", "blade" },
        },
        emmet_ls = {
          filetypes = { "html", "css", "blade", "javascriptreact", "typescriptreact" },
          init_options = {
            html = { options = { ["output.selfClosingStyle"] = "html" } },
          },
        },
        -- javascript & typescript
        ts_ls = {
          enabled = true,
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        },
        eslint = {},
        -- php
        phpactor = {
          enabled = lsp == "phpactor",
        },
        antlersls = {
          enabled = false,
        },
        -- php
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
        kotlin_language_server = {},
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
