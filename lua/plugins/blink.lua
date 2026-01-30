return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = { border = "rounded" },
        documentation = { window = { border = "rounded" } },
      },
      keymap = {
        ["<Tab>"] = {
          "snippet_forward",
          function() -- sidekick next edit suggestion
            return require("sidekick").nes_jump_or_apply()
          end,
          function() -- if you are using Neovim's native inline completions
            return vim.lsp.inline_completion.get()
          end,
          "fallback",
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        --   providers = {
        --     snippets = {
        --       name = "Snippets",
        --       module = "blink.cmp.sources.snippets",
        --       score_offset = 1000,
        --       opts = {
        --         friendly_snippets = false,
        --         search_paths = { vim.fn.stdpath("config") .. "/snippets" },
        --       },
        --     },
        --   },
      },
    },
  },
}
