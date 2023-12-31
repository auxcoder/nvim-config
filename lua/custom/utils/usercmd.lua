---@diagnostic disable: need-check-nil
local create_cmd = vim.api.nvim_create_user_command
local settings = require('custom.chadrc').settings
local g = vim.g
local fn = vim.fn

local function setAutoCmp(mode)
	if mode then
		require('cmp').setup({
			completion = {
				autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
			},
		})
	else
		require('cmp').setup({
			completion = {
				autocomplete = false,
			},
		})
	end
end

local function yank_file_path(expr)
	fn.setreg('+', fn.expand(expr))
	vim.notify('Yanked file path: ' .. fn.getreg('+'))
end

create_cmd('YankPath', function()
	yank_file_path('%')
end, { desc = "Yank current file's path relative to cwd" })

create_cmd('YankPathFull', function()
	yank_file_path('%:~')
end, { desc = "Yank current file's absolute path" })
create_cmd('UFOOpen', function()
	require('ufo').openAllFolds()
end, {})


-- Command to toggle inline diagnostics
vim.api.nvim_create_user_command('DiagnosticsToggleVirtualText', function()
	local current_value = vim.diagnostic.config().virtual_text
	if current_value then
		vim.diagnostic.config({ virtual_text = false })
	else
		vim.diagnostic.config({ virtual_text = true })
	end
end, {})

-- Command to toggle diagnostics
vim.api.nvim_create_user_command('DiagnosticsToggle', function()
	local current_value = vim.diagnostic.is_disabled()
	if current_value then
		vim.diagnostic.enable()
	else
		vim.diagnostic.disable()
	end
end, {})

vim.api.nvim_create_user_command('Format', function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			['end'] = { args.line2, end_line:len() },
		}
	end
	require('conform').format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

-- Toggle colorcolumn
create_cmd('TCC', function()
	vim.g.ccenable = not vim.g.ccenable

	if vim.g.ccenable then
		vim.opt.cc = settings.cc_size
	else
		vim.opt.cc = '0'
	end
end, {})

-- Toggle CMP
g.cmptoggle = true
create_cmd('CmpToggle', function()
	g.cmptoggle = not g.cmptoggle
	if g.cmptoggle then
		vim.cmd('echo  "CmpAutoComplete is on"')
		setAutoCmp(true)
	else
		vim.cmd('echo  "CmpAutoComplete is off"')
		setAutoCmp(false)
	end
end, {})

create_cmd('Healthcheck', function()
	vim.cmd('checkhealth')
end, {})

create_cmd('Commandcenter', function()
	vim.cmd('Telescope commander')
end, {})

-- Update nvim
create_cmd('TUpdate', function()
	require('lazy').load({ plugins = { 'mason.nvim', 'nvim-treesitter' } })
	vim.cmd('MasonUpdate')
	vim.cmd('TSUpdate')
	vim.cmd('NvChadUpdate')
end, {})
