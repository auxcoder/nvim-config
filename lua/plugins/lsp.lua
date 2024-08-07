return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        groovyls = {},
        tailwindcss = {
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  "@?class\\(([^]*)\\)",
                  "'([^']*)'",
                },
              },
            },
          },
        },
        emmet_ls = {
          filetypes = {
            -- "astro",
            "blade",
            "css",
            "eruby",
            "html",
            -- "htmldjango",
            -- "javascriptreact",
            -- "less",
            -- "pug",
            -- "sass",
            "scss",
            -- "svelte",
            "typescriptreact",
            -- "vue",
          },
        },
      },
			autoformat = true,
    },
  },
}
