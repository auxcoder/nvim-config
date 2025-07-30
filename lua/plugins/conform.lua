local util = require("conform.util")
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    ---@class ConformOpts
    local opts = {
      -- LazyVim will use these options when formatting with the conform.nvim formatter
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        php = { "pint", "php" }, -- "pint", "php_cs_fixer"
        blade = { "blade-formatter", "rustywind" },
        python = { "isort" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
      },
      -- LazyVim will merge the options you set here with builtin formatters.
      -- You can also define any custom formatters here.
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      formatters = {
        injected = {
          options = {
            ignore_errors = true,
          },
        },
        blade_formatter = {
          command = "blade-formatter",
          args = {
            "--write",
            "$FILENAME",
            "--wrap-line-length",
            "9999",
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
        phpcbf = {
          command = "phpcbf",
          args = { "--standard=.phpcs.xml", "--no-patch", "--report=summary", "-" },
          stdin = true,
          cwd = require("conform.util").root_file({ ".git" }),
        },
        -- Example of using dprint only when a dprint.json file is present
        -- dprint = {
        --   condition = function(ctx)
        --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
        --   end,
        -- },
        -- Example of using shfmt with extra args
        -- shfmt = {
        --   extra_args = { "-i", "2", "-ci" },
        -- },
      },
      -- Set this to change the default values when calling conform.format()
      -- This will also affect the default values for format_on_save/format_after_save
      default_format_opts = {
        lsp_format = "fallback",
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
      },
      -- Don't set opts.format_on_save for conform.nvim. LazyVim will use the conform formatter automatically
      -- If this is set, Conform will run the formatter on save.
      -- It will pass the table to conform.format().
      -- This can also be a function that returns the table.
      -- format_on_save = {
      --   lsp_format = "fallback",
      --   timeout_ms = 500,
      -- },
      -- Don't set opts.format_after_save for conform.nvim. LazyVim will use the conform formatter automatically
      -- If this is set, Conform will run the formatter asynchronously after save.
      -- It will pass the table to conform.format().
      -- This can also be a function that returns the table.
      -- format_after_save = {
      --   lsp_format = "fallback",
      -- },
    }

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
