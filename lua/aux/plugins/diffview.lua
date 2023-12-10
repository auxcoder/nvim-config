return {
	'sindrets/diffview.nvim',
	event = 'BufRead',
	config = function()
		-- See ':h diffview-config-enhanced_diff_hl'
		local diffview = require('diffview')

		diffview.setup({
			enhanced_diff_hl = true,
			view = {
				merge_tool = {
					layout = 'diff3_mixed',
				},
			},
		})
	end,
}
