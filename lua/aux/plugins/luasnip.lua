local function setup()
	local luasnip = require('luasnip')

	luasnip.setup({
		-- Allows reentering old snippets
		history = true,

		-- Update snippets dynamically while typing
		update_events = { 'TextChanged', 'TextChangedI' },

		-- Delete snippets from history when appropriate
		delete_check_events = 'InsertLeave',

		-- Don't need autosnippets for now
		enabled_autosnippets = true,

		-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#ext_opts
		-- ext_opts = {
		-- 	[types.choiceNode] = {
		-- 		active = {
		-- 			virt_text = { { '<-', 'Error' } },
		-- 		},
		-- 	},
		-- },

		-- Ask treesitter for filetype for sub-languages
		ft_func = require('luasnip.extras.filetype_functions').from_pos_or_filetype,
	})

	require('luasnip.loaders.from_lua').load({ paths = vim.fn.stdpath('config') .. '/lua/aux/snippets' })
end

return {
	'L3MON4D3/LuaSnip',
	event = 'InsertEnter',
	config = setup,
}
