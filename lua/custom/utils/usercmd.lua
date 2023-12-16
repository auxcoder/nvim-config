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
create_cmd('UFOOpen', function()
	require('ufo').openAllFolds()
end, {})

-- Toggle colorcolumn
create_cmd('TCC', function()
	vim.g.ccenable = not vim.g.ccenable

	if vim.g.ccenable then
		vim.opt.cc = settings.cc_size
	else
		vim.opt.cc = '0'
	end
end, {})
