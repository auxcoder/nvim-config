return {
	'NvChad/nvim-colorizer.lua',
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local colorizer = require('colorizer')
		-- Attach to certain Filetypes, add special configuration
		-- Use `background` for everything else.
		colorizer.setup({
			filetypes = {
				'*', -- Highlight all files, but customize some others.
				css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
				html = { names = false }, -- Disable parsing "names" like Blue or Gray
			},
		})
	end,
}
