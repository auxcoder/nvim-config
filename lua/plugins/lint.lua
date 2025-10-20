return {
  "mfussenegger/nvim-lint",
  -- Event to trigger linters
  -- event = { "BufWritePost", "BufReadPost", "InsertLeave" },
  -- event = { "BufWritePost" },
  config = function()
    local lint = require("lint")
    local conform = require("conform")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      -- svelte = { "eslint_d" },
      fish = { "fish" },
      dockerfile = { "hadolint" },
      php = { "phpcs" }, -- "phpcs" -- syntax errors only
      markdown = { "markdownlint" },
      kotlin = { "ktlint" },
      python = { "pylint" },
      -- Use the "*" filetype to run linters on all filetypes.
      -- ['*'] = { 'global linter' },
      -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
      -- ['_'] = { 'fallback linter' },
    }

    lint.linters.eslint_d = {
      name = "eslint_d",
      cmd = "eslint_d",
      stdin = true,
      args = {
        "--no-eslintrc",
        "--config", vim.fn.stdpath("config") .. "/eslint.config.js",
        "--format", "compact",
        "--stdin",
        "--stdin-filename", "%filepath",
      },
      parser = require("lint.parser").from_errorformat("%f: line %l, col %c, %m", {
        source = "eslint_d",
        severity = vim.diagnostic.severity.WARN,
      }),
    }

    -- Use built-in eslint_d configuration from nvim-lint
    lint.linters.markdownlint = {
      name = "markdownlint",
      cmd = "markdownlint",
      args = { "--disable", "MD013" }, -- Disable line length rule
      stdin = true,
      parser = require("lint.parser").from_pattern(
        [[:(%d+):(%d+) ([%w-/]+) (.*)]],
        { "line", "col", "code", "message" },
        {
          source = "markdownlint",
          severity = vim.diagnostic.severity.WARN,
        }
      ),
    }

    lint.linters.phpcs = {
      name = "phpcs",
      cmd = "phpcs", -- Make sure it's in your PATH
      stdin = false,
      -- or whatever standard you use
      -- args = { "--standard=" .. vim.fn.expand("~/.ruleset.xml") },
      stream = "stderr",
      ignore_exitcode = true,
      parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
        source = "phpcs",
        severity = vim.diagnostic.severity.WARN,
      }),
    }

    -- Example of using selene only when a selene.toml file is present
    -- lint.linters.selene = {
    --   -- `condition` is another LazyVim extension that allows you to
    --   -- dynamically enable/disable linters based on the context.
    --   condition = function(ctx)
    --     return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
    --   end,
    -- }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      group = lint_augroup,
      callback = function()
        -- Run conform formatting first, commented due conflicts with prettier
        conform.format({ async = true })

        -- Use eslint --fix for formatting + linting
        -- vim.cmd("silent !eslint_d --fix " .. vim.fn.expand("%"))

        -- Then trigger linting
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
