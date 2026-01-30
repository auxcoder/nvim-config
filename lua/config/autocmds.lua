-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Blade file handling
local blade_augroup = vim.api.nvim_create_augroup("blade_setup", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = blade_augroup,
  pattern = "*.blade.php",
  callback = function()
    vim.bo.filetype = "blade"
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

-- Set indentation for Go files according to community standards
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "go",
--   callback = function()
--     vim.bo.shiftwidth = 4 -- Standard Go indentation width for display
--     vim.bo.tabstop = 4 -- Standard Go tab width for display
--     vim.bo.softtabstop = 4 -- Consistent with tabstop
--     vim.bo.expandtab = false -- Use tabs instead of spaces (Go standard)
--   end,
-- })
-- Organize imports on save using goimports
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     local params = vim.lsp.util.make_range_params()
--     params.context = { only = { "source.organizeImports" } }
--
--     -- Increase timeout to 3000ms for larger codebases
--     local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
--
--     -- Add error handling
--     if not result or vim.tbl_isempty(result) then
--       -- No result could mean the server doesn't support this feature or there was an error
--       return
--     end
--
--     for cid, res in pairs(result) do
--       -- Check if we have a valid result
--       if res.result and not vim.tbl_isempty(res.result) then
--         for _, r in pairs(res.result) do
--           if r.edit then
--             local client = vim.lsp.get_client_by_id(cid)
--             local enc = client and client.offset_encoding or "utf-16"
--             vim.lsp.util.apply_workspace_edit(r.edit, enc)
--           end
--         end
--       end
--     end
--
--     -- Format the file
--     vim.lsp.buf.format({ async = false })
--   end,
-- })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "html",
  callback = function()
    vim.opt_local.foldmethod = "indent"
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

-- Enable spell checking for specific file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit", "tex" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_user_command("CleanSwap", function()
  os.execute([[find . -type f \( -name "*.swp" -o -name "*.swo" -o -name "*.swx" \) -delete]])
  print("🧼 Swap files nuked.")
end, {})

-- Import your sorter logic
local sorter = require("config.bootstrap-sorter")
-- Create an autocommand group to prevent duplicate registrations
local bootstrap_grp = vim.api.nvim_create_augroup("BootstrapSorter", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = bootstrap_grp,
  -- List the file extensions you want to target: "*.php", "*.blade.php", "*.jsx", "*.tsx"
  pattern = { "*.html", "*.blade.php" },
  callback = function()
    -- This runs the sorting logic right before the file hits the disk
    sorter.sort_file_classes()
  end,
})
