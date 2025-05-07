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
        args = { "--stdin", "--stdin-filename", "$FILENAME", "--format", "json" },
        parse = function(output)
          local ok, decoded = pcall(vim.json.decode, output)
          if not ok then
            return {}
          end
          -- parse decoded as needed
        end,
        -- args = { "--fix", "--stdin", "--stdin-filename", "%filepath" },
        -- parser = (function()
        --   local output = {} -- Collect chunks here
        --   return {
        --     on_chunk = function(chunk)
        --       table.insert(output, chunk) -- Store each chunk
        --     end,
        --     on_done = function()
        --       local data = table.concat(output) -- Combine all chunks
        --       local ok, result = pcall(vim.json.decode, data) -- Decode only once
        --       if not ok then
        --         vim.notify("Failed to decode linter output", vim.log.levels.ERROR)
        --         return
        --       end
        --       return result -- Send parsed JSON to nvim-lint
        --     end,
        --   }
        -- end)(),
        -- use_cache = true,
      },
      phpcs = {
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
