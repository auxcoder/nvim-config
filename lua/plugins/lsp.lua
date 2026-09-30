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
          filetypes = { "html", "blade", "eta", "php", "vue", "jsx", "tsx", "erb" },
          init_options = {
            provideFormatter = true,
            embeddedLanguages = { css = true, javascript = true },
          },
          -- HTML custom data: adds Bootstrap 5.3 class names as completions
          -- for the `class` attribute. The file uses the VS Code HTML custom
          -- data format (globalAttributes + valueSets), loaded via html.customData.
          settings = {
            html = {
              customData = {
                vim.fn.expand("~/.config/nvim/data/bootstrap5.json"),
              },
              -- Formatter behaviour. wrapLineLength = 0 disables the default
              -- 120-column line wrapping that was breaking paragraph text
              -- onto multiple lines. Matches the project's .vscode setting.
              format = {
                wrapLineLength = 0,
                wrapAttributes = "auto",
              },
            },
          },
        },
        emmet_ls = {
          -- "blade" is needed here to use emmet inside blade templates
          filetypes = { "html", "css", "blade", "eta", "eruby", "javascriptreact", "typescriptreact" },
          init_options = {
            html = { options = { ["output.selfClosingStyle"] = "html" } },
          },
        },
        -- css / scss / less (vscode-css-language-server)
        -- Plain CSS/SCSS IntelliSense: property & value completion, @-rules,
        -- color swatches, hover docs, native nesting support. No Tailwind.
        cssls = {
          filetypes = { "css", "scss", "less" },
          settings = {
            -- `unknownAtRules = "ignore"` so cssls won't falsely flag
            -- @container and SCSS at-rules; stylelint handles real linting.
            css = { validate = true, lint = { unknownAtRules = "ignore" } },
            scss = { validate = true, lint = { unknownAtRules = "ignore" } },
            less = { validate = true },
          },
        },
        -- SomeSass: cross-file SCSS symbols (variables, mixins, functions)
        -- resolved through @use / @import. Complements cssls.
        somesass_ls = {
          filetypes = { "scss", "css" },
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
