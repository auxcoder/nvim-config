local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.api.nvim_command
local augroup = vim.api.nvim_create_augroup
local settings = require('custom.chadrc').settings
local fn = vim.fn

autocmd('VimResized', {
	desc = 'Auto resize panes when resizing nvim window',
	pattern = '*',
	command = 'tabdo wincmd =',
})

autocmd({ 'BufNewFile', 'BufRead' }, {
	pattern = { '**/node_modules/**', 'node_modules', '/node_modules/*' },
	callback = function()
		vim.diagnostic.disable(0)
	end,
})

autocmd('FileType', {
	desc = 'Close NvimTree before quit nvim',
	pattern = { 'NvimTree' },
	callback = function(args)
		autocmd('VimLeavePre', {
			callback = function()
				vim.api.nvim_buf_delete(args.buf, { force = true })
				return true
			end,
		})
	end,
})

autocmd('User', {
	desc = 'Git conflict popup',
	pattern = 'GitConflictDetected',
	callback = function()
		vim.notify('Conflict detected in ' .. vim.fn.expand('<afile>'))
		vim.keymap.set('n', 'cww', function()
			engage.conflict_buster()
			create_buffer_local_mappings()
		end)
	end,
})

autocmd('BufWritePost', {
	desc = 'Reload NvimTree after writing the buffer',
	callback = function()
		local bufs = fn.getbufinfo()
		for _, buf in ipairs(bufs) do
			if buf.name:find('NvimTree_') then
				cmd('NvimTreeRefresh')
				break
			end
		end
	end,
})

-- Show cursor line only in active window
autocmd({ 'InsertLeave', 'WinEnter' }, {
	pattern = '*',
	command = 'set cursorline',
	group = augroup('CursorLine', { clear = true }),
})
autocmd({ 'InsertEnter', 'WinLeave' }, {
	pattern = '*',
	command = 'set nocursorline',
	group = augroup('CursorLine', { clear = true }),
})

-- Remove all trailing whitespace on save
autocmd('BufWritePre', {
	command = [[:%s/\s\+$//e]],
	group = augroup('TrimWhiteSpaceGrp', { clear = true }),
})

-- Restore cursor
autocmd({ 'BufReadPost' }, {
	pattern = { '*' },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})

-- Disable diagnostics in node_modules (0 is current buffer only)
autocmd({ 'BufRead', 'BufNewFile' }, {
	pattern = '*/node_modules/*',
	command = 'lua vim.diagnostic.disable(0)',
})

-- Nvimtree open file on creation
local function open_file_created()
	require('nvim-tree.api').events.subscribe('FileCreated', function(file)
		vim.cmd('edit ' .. file.fname)
	end)
end
autocmd({ 'VimEnter' }, {
	callback = open_file_created,
})

-- Automatically update changed file in Vim
-- Triger `autoread` when files changes on disk
-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
	command = [[silent! if mode() != 'c' && !bufexists("[Command Line]") | checktime | endif]],
})
