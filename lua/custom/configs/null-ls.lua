local present, null_ls = pcall(require, 'null_ls')

if not present then
	return
end

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

null_ls.setup({
	-- debug = true,
	sources = {
		-- webdev stuff
		-- null_ls.builtins.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
		null_ls.builtins.formatting.prettierd,
		-- .with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.formatting.clang_format,
	},
	on_attach = function(client, bufnr)
		if client.supports_method('textDocument/formatting') then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
