return {
	'rhysd/git-messenger.vim',
	config = function()
		-- Configure git-messenger options
		vim.g.git_messenger_floating_win_opts = { border = 'single' }
		vim.g.git_messenger_popup_content_margins = false
	end,
}
