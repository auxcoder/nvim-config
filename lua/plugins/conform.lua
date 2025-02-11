local util = require("conform.util")
return {
  "stevearc/conform.nvim",
  opts = function()
    ---@class ConformOpts
    local opts = {
      -- LazyVim will use these options when formatting with the conform.nvim formatter
      default_format_opts = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
      },
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        php = { "pint" }, -- "pint", "php_cs_fixer"
        blade = { "blade-formatter", "rustywind" },
        python = { "black" },
        javascript = { "prettierd" },
      },
      -- LazyVim will merge the options you set here with builtin formatters.
      -- You can also define any custom formatters here.
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      formatters = {
        injected = { options = { ignore_errors = true } },
        -- # Example of using dprint only when a dprint.json file is present
        -- dprint = {
        --   condition = function(ctx)
        --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
        --   end,
        -- },
        -- # Example of using shfmt with extra args
        -- shfmt = {
        --   extra_args = { "-i", "2", "-ci" },
        -- },
        ["blade-formatter"] = {
          command = "blade-formatter",
          args = {
            "--write",
            "$FILENAME",
            "--wrap-line-length",
            9999,
            "--wrap-attributes",
            "preserve-aligned",
          },
          cwd = util.root_file({ ".editorconfig", "composer.json", "package.json" }),
          stdin = false,
        },
        -- pint for use php laravel
        -- https://laravel.com/docs/11.x/pint
        pint = {
          meta = {
            url = "https://github.com/laravel/pint",
            description = "Laravel Pint is an opinionated PHP code style fixer. Pint is built on top of PHP-CS-Fixer.",
          },
          command = util.find_executable({ vim.fn.stdpath("data") .. "/mason/bin/pint", "vendor/bin/pint" }, "pint"),
          args = { "$FILENAME" },
          stdin = false,
        },
      },
    }

    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "*.html", -- Targets HTML files
      callback = function(args)
        local conform = require("conform")
        local formatters = conform.get_formatters("html")
        print("Conform Formatters:", vim.inspect(formatters))
        -- require("conform").format({ async = true })
      end,
    })

    return opts
  end,
  -- Keymap configuration in `init`
  init = function()
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
