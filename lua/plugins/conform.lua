return {
  "stevearc/conform.nvim",
  opts = {
    -- Auto-format on save is the standard LazyVim default
    -- format_on_save = { timeout_ms = 500, lsp_fallback = true },

    -- Define which formatters to use for each filetype
    formatters_by_ft = {
      -- PHP formatting, recommended for Laravel
      php = { "pint" },
      -- php = { "php_cs_fixer" },

      -- Use blade_formatter for .blade.php files
      blade = { "blade_formatter" },

      -- Example for related Laravel files
      javascript = { "prettier" },
      typescript = { "prettier" },
      json = { "prettier" },
      lua = { "stylua" },
    },

    formatters = {
      -- Custom config for php-cs-fixer, old way
      -- php_cs_fixer = {
      --   -- Check for the local binary path first, relative to the project root (CWD)
      --   command = "./vendor/bin/php-cs-fixer",
      --   -- Use an args setup that typically works for conform/stdin/stdout
      --   args = { "fix", "--using-cache=no", "--stdin-filepath", "$FILENAME", "--diff", "-" },
      --   -- Ensure it falls back to the system-wide 'php-cs-fixer' if the local path is not found
      --   condition = function(ctx)
      --     return vim.fn.executable(ctx.command)
      --   end,
      -- },
      -- Configuration for Laravel Pint
      pint = {
        -- COMMAND: Explicitly point to the project's local vendor/bin path first.
        command = "./vendor/bin/pint",

        -- ARGS: Pint is simple, it just needs the filename/path.
        args = { "$FILENAME" },

        -- CONDITION: CRITICAL for local binaries.
        -- This checks if the './vendor/bin/pint' file is executable.
        -- If it is found, it uses the local version. If not, conform may fall
        -- back to the global 'pint' (if it's in your PATH).
        condition = function(ctx)
          return vim.fn.executable(ctx.command)
        end,
      },
      -- Custom config blade_formatter
      blade_formatter = {
        -- https://github.com/shufo/blade-formatter, installed via npm install blade-formatter
        command = "./node_modules/.bin/blade-formatter",
        args = { "--stdin-filepath", "$FILENAME" },
        condition = function(ctx)
          return vim.fn.executable(ctx.command)
        end,
        -- You may need to set the command explicitly if you installed it via a specific local composer/npm path
        -- command = "./node_modules/.bin/blade-formatter"
      },
    },
  },
}
