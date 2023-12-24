local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
-- local others = { "clangd" }
local servers = { "eslint", "html", "cssls", "tsserver", "tailwindcss", "emmet_ls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    filetypes = { "css", "eruby", "html", "javascript", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
})

