-- https://github.com/preservim/tagbar
return {
	'preservim/tagbar',
	config = function()
		-- set keymaps
		vim.keymap.set('n', '<F8>', ':TagbarToggle<CR>', { desc = 'Toggle Ctags sidebar' })
	end,
}
