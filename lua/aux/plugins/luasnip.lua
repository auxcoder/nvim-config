return {
	'L3MON4D3/LuaSnip',
	event = 'InsertEnter',
	config = function()
		local luasnip = require('luasnip')

		luasnip.setup({
			history = true, -- Allows reentering old snippets
			update_events = { 'TextChanged', 'TextChangedI' }, -- Update snippets dynamically while typing
			delete_check_events = 'InsertLeave', -- Delete snippets from history when appropriate
			enabled_autosnippets = true, -- Don't need autosnippets for now
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
	end,
}
