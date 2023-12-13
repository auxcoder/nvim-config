local M = {}
return {
	'mfussenegger/nvim-lint',
	lazy = true,
	opts = {
		events = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
		linters_by_ft = {
			dockerfile = { 'hadolint' },
			sh = { 'shellcheck' },
			go = { 'golangcilint' },
			json = { 'jsonlint' },
			yaml = { 'yamllint' },
			markdown = { 'markdownlint' },
			javascript = { 'eslint_d' },
			typescript = { 'eslint_d' },
			javascriptreact = { 'eslint_d' },
			typescriptreact = { 'eslint_d' },
			svelte = { 'eslint_d' },
			py = { 'flake8' },
			python = { 'pylint' },
		},
		linters = {},
	},
	config = function()
		local a = vim.api
		local k = vim.keymap
		local lint = require('lint')

		for name, linter in pairs(M.opts.linters) do
			if type(linter) == 'table' and type(lint.linters[name]) == 'table' then
				lint.linters[name] = vim.tbl_deep_extend('force', lint.linters[name], linter)
			else
				lint.linters[name] = linter
			end
		end

		lint.linters_by_ft = M.opts.linters_by_ft

		function M.debounce(ms, fn)
			local timer = vim.loop.new_timer()
			return function(...)
				local argv = { ... }
				timer:start(ms, 0, function()
					timer:stop()
					vim.schedule_wrap(fn)(table.unpack(argv))
				end)
			end
		end

		function M.lint()
			local names = lint.linters_by_ft[vim.bo.filetype] or {}
			local ctx = { filename = a.nvim_buf_get_name(0) }
			ctx.dirname = vim.fn.fnamemodify(ctx.filename, ':h')
			names = vim.tbl_filter(function(name)
				local linter = lint.linters[name]
				return linter and not (type(linter) == 'table' and linter.condition and not linter.condition(ctx))
			end, names)

			if #names > 0 then
				lint.try_lint(names)
			end
		end

		a.nvim_create_autocmd(M.opts.events, {
			group = a.nvim_create_augroup('nvim-lint', { clear = true }),
			callback = M.debounce(100, M.lint),
		})

		k.set('n', '<leader>l', function()
			lint.try_lint()
		end, { desc = 'Trigger linting for current file' })
	end,
}
