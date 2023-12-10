-- https://github.com/goolord/alpha-nvim
return {
	'goolord/alpha-nvim',
	event = 'VimEnter',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local alpha = require('alpha')
		local dashboard = require('alpha.themes.dashboard') -- alpha.themes.startify

		-- Set header
		dashboard.section.header.val = {
			'                                                     ',
			'  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
			'  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
			'  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
			'  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
			'  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
			'  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
			'                                                     ',
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button('e', '  > New File', '<cmd>ene<CR>'),
			dashboard.button('SPC ee', '  > Toggle file explorer', '<cmd>NvimTreeToggle<CR>'),
			dashboard.button('SPC ff', '󰱼 > Find File', '<cmd>Telescope find_files<CR>'),
			dashboard.button('SPC fs', '  > Find Word', '<cmd>Telescope live_grep<CR>'),
			dashboard.button('SPC wr', '󰁯  > Restore Session For Current Directory', '<cmd>SessionRestore<CR>'),
			dashboard.button('q', ' > Quit NVIM', '<cmd>qa<CR>'),
		}

		dashboard.config.opts.noautocmd = true

		-- local handle = io.popen('fortune')
		-- local fortune = handle:read('*a')
		-- handle:close()
		-- dashboard.section.footer.val = fortune
		-- dashboard.config.opts.noautocmd = true
		-- Disable folding on alpha buffer
		-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
		-- vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
		-- Send config to alpha
		alpha.setup(dashboard.config)
		-- alpha.setup(dashboard.config)
	end,
}
