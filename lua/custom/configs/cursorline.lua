
local present, cursorline = pcall(require, 'vim-cursorline')

if not present then
	return
end

cursorline.setup({
	cursorline = {
		enable = true,
		timeout = 1000,
		number = false,
	},
	cursorword = {
		enable = true,
		min_length = 3,
		hl = { underline = true },
	}
})
