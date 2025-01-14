-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Define an autocmd group for the blade workaround
local augroup = vim.api.nvim_create_augroup("lsp_blade_workaround", { clear = true })

-- Autocommand to temporarily change 'blade' filetype to 'php' when opening for LSP server activation
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup,
  pattern = "*.blade.php",
  callback = function()
    vim.bo.filetype = "php"
  end,
})

-- Add support for Go templates
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.gohtml,*.gotmpl",
  -- pattern = "*.gohtml,*.gotmpl,*.html",
  callback = function()
    if vim.fn.search("{{.\\+}}", "nw") ~= 0 then
      local buf = vim.api.nvim_get_current_buf()
      vim.bo[buf].filetype = "gotmpl"
      vim.bo[buf].filetype = "html"
    else
      vim.bo.filetype = "html"
    end
  end,
})

-- Set indentation for Go files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.bo.shiftwidth = 2 -- Change this value to your desired indentation width
    vim.bo.tabstop = 2 -- Change this value to your desired tab stop
    vim.bo.expandtab = false -- Use tabs instead of spaces for Go files (common convention)
  end,
})

-- to have your imports organized on save using the logic of goimports
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({async = false})
  end
})

-- Additional autocommand to switch back to 'blade' after LSP has attached
vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*.blade.php",
  callback = function(args)
    vim.schedule(function()
      -- Check if the attached client is 'intelephense'
      for _, client in ipairs(vim.lsp.get_clients()) do
        if client.name == "intelephense" and client.attached_buffers[args.buf] then
          vim.bo[args.buf].filetype = "blade"
          -- update treesitter parser to blade
          vim.bo[args.buf].syntax = "blade"
          break
        end
      end
    end)
  end,
})

-- Disable Codeium for markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- Assuming Codeium has a configuration option `enabled`
    vim.b.codeium_enabled = false
  end,
})

-- Prevent highlighting AngularJs expressions  {{$ctrl}} as error
vim.api.nvim_create_autocmd("FileType", {
  pattern = "html",
  callback = function()
    vim.cmd("setlocal filetype=html.angularjs")
    vim.cmd('syntax match angularjsExpression "{{\\$ctrl\\.\\w+}}"')
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "Jenkinsfile*",
  callback = function()
    vim.bo.filetype = "groovy"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "Dockerfile.*",
  callback = function()
    vim.bo.filetype = "dockerfile"
  end,
})

-- make $ part of the keyword for php.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    vim.opt.iskeyword:append("$")
  end,
})
