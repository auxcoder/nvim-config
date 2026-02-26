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
        -- for Statamic CMS, not uesed
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
        -- groovy (for Jenkins Pipeline)
        groovyls = {
          enabled = false,
        },
        -- This is technically redundant if lsp is "intelephense"
        -- [lsp] = {
        --   enabled = true,
        -- },
      },
      setup = {
        intelephense = function(opts)
          -- This ensures your custom settings are passed to the server
          require("lspconfig").intelephense.setup({
            settings = {
              intelephense = {
                environment = {
                  phpVersion = "8.3",
                },
                -- Keep your file types and associations here
                filetypes = { "php", "blade", "php_only" },
                files = {
                  associations = { "*.php", "*.blade.php" },
                },
                -- You can add the following to ignore certain files/folders
                -- runtime specific to Laravel (e.g., storage, cache)
                stubs = {
                  "php", -- for core functions like is_dir()
                  "standard",
                  "random", -- this specifically loads rand(), mt_rand(), etc.
                  "date", -- this loads time(), date(), strtotime(), etc.
                  "Core", -- this loads \Exception, \DateTime, \stdClass, etc
                  "codeception",
                  -- LARAVEL SPECIFIC STUBS (CRITICAL)
                  "laravel", -- Route::get(), Auth::user(), dd()
                  "fileinfo", -- Helps with file system-related functions (used by Storage)
                  -- COMMON LARAVEL EXTENSIONS
                  "json", -- json_encode(), json_decode()
                },
                completion = {
                  fullyQualifyGlobalFunctionsAndConstants = true,
                },
              },
            },
            -- Ensure it attaches to the correct buffers (especially 'blade')
            -- This might be redundant with filetypes above but good for safety
            ft = { "php", "blade", "php_only" },
            -- Any other language server options
          })
        end,
      },
      autoformat = true,
    },
  },
}
