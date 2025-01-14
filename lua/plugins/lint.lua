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
      svelte = { "eslint_d" },
      fish = { "fish" },
      dockerfile = { "hadolint" },
      php = {}, -- "phpcs"
      markdown = {},
      python = { "pylint" },
      -- Use the "*" filetype to run linters on all filetypes.
      -- ['*'] = { 'global linter' },
      -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
      -- ['_'] = { 'fallback linter' },
    }
    ---@type table<string,table>
    lint.linters = {
      markdownlint = {
        args = { "--disable", "MD013" }, -- Disable line length rule
        -- Uncomment below to use a specific markdownlint config file:when
        -- args = { "--config", "/path/to/your/.markdownlint.json" },
      },
      eslint_d = {
        name = "eslint_d",
        cmd = "eslint_d", -- Make sure this is correct
        args = { "--fix", "--stdin", "--stdin-filename", "%filepath" },
        parser = {
          on_chunk = function(chunk)
            local data = vim.fn.json_decode(chunk)
            return data
          end,
          on_done = function()
            -- No-op: This is just to fulfill the requirement for `on_done`
          end,
        },
        use_cache = true,
      },
      -- Example of using selene only when a selene.toml file is present
      -- selene = {
      --   -- `condition` is another LazyVim extension that allows you to
      --   -- dynamically enable/disable linters based on the context.
      --   condition = function(ctx)
      --     return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
      --   end,
      -- },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      group = lint_augroup,
      callback = function()
        -- Run conform formatting first
        conform.format({ async = true })
        -- Then trigger linting
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
