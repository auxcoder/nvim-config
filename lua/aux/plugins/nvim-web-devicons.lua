-- require having installed locally the nerd font
-- https://www.nerdfonts.com/font-downloads
-- set terminal font (iTerm -> Settings -> Profile (target) -> Text -> Font)
return {
	'nvim-tree/nvim-web-devicons',
	config = function()
		require('nvim-web-devicons').set_icon({
			gql = {
				icon = '',
				color = '#e535ab',
				cterm_color = '199',
				name = 'GraphQL',
			},
		})
	end,
}
