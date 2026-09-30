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

      -- Eta templates (HTML-like, formatted with prettier)
      eta = { "prettier" },

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
        -- Prefer the project's local Pint (./vendor/bin/pint); fall back to a
        -- globally-installed `pint` on PATH if the local one isn't present.
        command = function()
          local local_bin = "./vendor/bin/pint"
          if vim.fn.executable(local_bin) == 1 then
            return local_bin
          end
          return "pint"
        end,
        args = { "$FILENAME" },
        condition = function(ctx)
          return vim.fn.executable("./vendor/bin/pint") == 1 or vim.fn.executable("pint") == 1
        end,
      },
      -- Custom config blade_formatter
      blade_formatter = {
        -- https://github.com/shufo/blade-formatter
        -- Prefer the project-local binary (./node_modules/.bin/blade-formatter);
        -- fall back to a globally-installed `blade-formatter` on PATH.
        command = function()
          local local_bin = "./node_modules/.bin/blade-formatter"
          if vim.fn.executable(local_bin) == 1 then
            return local_bin
          end
          return "blade-formatter"
        end,
        args = { "--indent-size", "4", "--stdin-filepath", "$FILENAME" },
        condition = function(ctx)
          -- Available if either the local or a global binary can be found.
          return vim.fn.executable("./node_modules/.bin/blade-formatter") == 1
            or vim.fn.executable("blade-formatter") == 1
        end,
      },
    },
  },
}
