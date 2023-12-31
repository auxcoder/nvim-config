local present, ufo = pcall(require, 'ufo')

if not present then
	return
end

-- https://github.com/kevinhwang91/nvim-ufo/blob/main/doc/example.lua
local function handleFallbackException(bufnr, err, providerName)
	if type(err) == 'string' and err:match('UfoFallbackException') then
		return require('ufo').getFolds(bufnr, providerName)
	else
		return require('promise').reject(err)
	end
end

---@param bufnr number
---@return Promise
local function customizeSelector(bufnr)
	return require('ufo').getFolds(bufnr, 'lsp'):catch(function(err)
		return handleFallbackException(err, 'treesitter')
	end):catch(function(err)
		return handleFallbackException(err, 'indent')
	end)
end

-- render count of folded lines
local handler = function(virtText, lnum, endLnum, width, truncate)
	local newVirtText = {}
	local suffix = (' ↙ %d '):format(endLnum - lnum)
	local sufWidth = vim.fn.strdisplaywidth(suffix)
	local targetWidth = width - sufWidth
	local curWidth = 0
	for _, chunk in ipairs(virtText) do
		local chunkText = chunk[1]
		local chunkWidth = vim.fn.strdisplaywidth(chunkText)
		if targetWidth > curWidth + chunkWidth then
			table.insert(newVirtText, chunk)
		else
			chunkText = truncate(chunkText, targetWidth - curWidth)
			local hlGroup = chunk[2]
			table.insert(newVirtText, { chunkText, hlGroup })
			chunkWidth = vim.fn.strdisplaywidth(chunkText)
			-- str width returned from truncate() may less than 2nd argument, need padding
			if curWidth + chunkWidth < targetWidth then
				suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
			end
			break
		end
		curWidth = curWidth + chunkWidth
	end
	table.insert(newVirtText, { suffix, 'UfoFoldedEllipsis' })
	return newVirtText
end

local ftMap = {
	vim = 'indent',
	python = {'indent'},
	git = '',
	go = "lsp",
}

ufo.setup({
	close_fold_kinds = { 'imports', 'comment' },
	open_fold_hl_timeout = 400,
	fold_virt_text_handler = handler, -- render lines count
	preview = {
		win_config = {
			border = { "", "─", "", "", "", "─", "", "" },
			-- winhighlight = "Normal:Folded",
			winblend = 0,
		},
		mappings = {
			scrollU = "<C-u>",
			scrollD = "<C-d>",
			jumpTop = "[",
			jumpBot = "]",
		},
	},
	 provider_selector = function(_, filetype, buftype)
		-- use nested markdown folding
		if filetype == 'markdown' then
			return ''
		end

		-- only use indent until a file is opened
		-- return ftMap[filetype] or customizeSelector
		return ftMap[filetype] or {'treesitter', 'indent'}
	end,
})

