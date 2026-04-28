local lsp = vim.g.lazyvim_php_lsp or "intelephense"

return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- add longer timeout, since formatting blade files gets a little slow
      format = { timeout_ms = 2000 },
      servers = {
        -- Disable copilot
        copilot = {
          enabled = false,
        },
        -- html
        html = {
          filetypes = { "html", "blade" },
        },
        emmet_ls = {
          -- "blade" is needed here to use emmet inside blade templates
          filetypes = { "html", "css", "blade", "javascriptreact", "typescriptreact" },
          init_options = {
            html = { options = { ["output.selfClosingStyle"] = "html" } },
          },
        },
        -- javascript & typescript (handled by lazyvim.plugins.extras.lang.typescript)
        eslint = {},
        -- php
        phpactor = {
          enabled = lsp == "phpactor",
        },
        -- for Statamic CMS, not uesed
        antlersls = {
          enabled = false,
        },
        -- php
        intelephense = {
          enabled = lsp == "intelephense",
          filetypes = { "php", "blade", "php_only" },
          settings = {
            intelephense = {
              environment = {
                phpVersion = "8.3",
              },
              files = {
                associations = { "*.php", "*.blade.php" },
                maxSize = 5000000,
              },
              stubs = {
                "php",
                "standard",
                "random",
                "date",
                "Core",
                "codeception",
                -- LARAVEL SPECIFIC STUBS (CRITICAL)
                "laravel",
                "fileinfo",
                -- COMMON LARAVEL EXTENSIONS
                "json",
              },
              completion = {
                fullyQualifyGlobalFunctionsAndConstants = true,
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
        -- groovy (for Jenkins Pipeline)
        groovyls = {
          enabled = false,
        },
        -- This is technically redundant if lsp is "intelephense"
        -- [lsp] = {
        --   enabled = true,
        -- },
      },
      autoformat = true,
    },
  },
}
