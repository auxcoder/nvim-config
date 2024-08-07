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
        [lsp] = {
          enabled = true,
        },
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
