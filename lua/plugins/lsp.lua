if lazyvim_docs then
  -- LSP Server to use for PHP.
  vim.g.lazyvim_php_lsp = "intelephense" -- "intelephense", "phpactor"
end
local lsp = vim.g.lazyvim_php_lsp or "intelephense"

return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      -- add longer timeout, since formatting blade files gets a little slow
      format = { timeout_ms = 2000 },
      ---@type lspconfig.options
      servers = {
        -- automatically installed with mason and loaded with lspconfig
        -- pyright = {},
        -- groovyls = {},
        phpactor = {
          enabled = lsp == "phpactor",
        },
        -- lsp = {
        --   enabled = true,
        -- },
        -- VUE 3
        -- volar = {
        --   filetypes = { "vue" },
        --   init_options = {
        --     vue = {
        --       hybridMode = false,
        --     },
        --   },
        --   settings = {
        --     typescript = {
        --       inlayHints = {
        --         enumMemberValues = {
        --           enabled = true,
        --         },
        --         functionLikeReturnTypes = {
        --           enabled = true,
        --         },
        --         propertyDeclarationTypes = {
        --           enabled = true,
        --         },
        --         parameterTypes = {
        --           enabled = true,
        --           suppressWhenArgumentMatchesName = true,
        --         },
        --         variableTypes = {
        --           enabled = true,
        --         },
        --       },
        --     },
        --   },
        -- },
        -- typescript
        tsserver = {
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = vim.fn.stdpath("data")
                  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                languages = { "vue" },
              },
            },
          },
          settings = {
            typescript = {
              tsserver = {
                useSyntaxServer = false,
              },
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        -- php
        intelephense = {
          settings = {
            intelephense = {
              format = {
                braces = "k&r",
              },
            },
          },
        },
      },
      autoformat = true,
    },
  },
}
