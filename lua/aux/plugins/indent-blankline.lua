-- Add indentation guides even on blank lines
return {
	'lukas-reineke/indent-blankline.nvim',
	event = 'BufRead',
	config = function()
		local ibl = require('ibl')
		local hooks = require('ibl.hooks')

		ibl.setup({
			exclude = {
				filetypes = { 'help', 'packer', 'FTerm' },
				buftypes = { 'terminal', 'nofile' },
			},
			-- Background color indentation guides
			-- indent = { highlight = {'CursorColumn', 'Whitespace'}, char = '' },
			-- whitespace = {
			-- 	highlight = highlight,
			-- 	remove_blankline_trail = false,
			-- },
			-- scope = { enabled = false },
		})

		hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
	end,
	-- See `:help ibl`
	main = 'ibl',
	opts = {},
}
