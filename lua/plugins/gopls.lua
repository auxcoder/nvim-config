return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      gopls = {
        settings = {
          gopls = {
          gofumpt = true,
          codelenses = {
            gc_details = false,
            generate = true,
            regenerate_cgo = true,
            run_govulncheck = true,
            test = true,
            tidy = true,
            upgrade_dependency = true,
            vendor = true,
          },
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
          analyses = {
            fieldalignment = true,
            nilness = true,
            unusedparams = true,
            unusedwrite = true,
            useany = true,
          },
          usePlaceholders = true,
          completeUnimported = true,
          staticcheck = true,
          directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
          semanticTokens = true,
        }
      }
    }
  },
    setup = {
      gopls = function(_, opts)
        -- workaround for gopls not supporting semanticTokensProvider
        -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
        LazyVim.lsp.on_attach(function(client, _)
          if not client.server_capabilities.semanticTokensProvider then
            local semantic = client.config.capabilities.textDocument.semanticTokens
            client.server_capabilities.semanticTokensProvider = {
              full = true,
              legend = {
                tokenTypes = semantic.tokenTypes,
                tokenModifiers = semantic.tokenModifiers,
              },
              range = true,
            }
          end
        end, "gopls")
        -- end workaround
      end,
    },
  }
}

-- lspconfig.gopls.setup({
--   cmd = { "gopls" },
--   filetypes = { "go", "gomod", "gowork", "gotmpl" },
--   root_dir = function(fname)
--     -- see: https://github.com/neovim/nvim-lspconfig/issues/804
--     if not mod_cache then
--       local result = async.run_command({ "go", "env", "GOMODCACHE" })
--       if result and result[1] then
--         mod_cache = vim.trim(result[1])
--       end
--     end
--     if fname:sub(1, #mod_cache) == mod_cache then
--       local clients = util.get_lsp_clients({ name = "gopls" })
--       if #clients > 0 then
--         return clients[#clients].config.root_dir
--       end
--     end
--     return util.root_pattern("go.work", "go.mod", ".git")(fname)
--   end,
--   single_file_support = true,
--   docs = {
--     default_config = {
--       root_dir = [[root_pattern("go.work", "go.mod", ".git")]],
--     },
--   }
-- })

-- return {
--   default_config = {
--     cmd = { "gopls" },
--     filetypes = { "go", "gomod", "gowork", "gotmpl" },
--   },
-- }
