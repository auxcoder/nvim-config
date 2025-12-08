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

-- Set indentation for Go files according to community standards
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.bo.shiftwidth = 4 -- Standard Go indentation width for display
    vim.bo.tabstop = 4 -- Standard Go tab width for display
    vim.bo.softtabstop = 4 -- Consistent with tabstop
    vim.bo.expandtab = false -- Use tabs instead of spaces (Go standard)
  end,
})
-- Organize imports on save using goimports
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }

    -- Increase timeout to 3000ms for larger codebases
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)

    -- Add error handling
    if not result or vim.tbl_isempty(result) then
      -- No result could mean the server doesn't support this feature or there was an error
      return
    end

    for cid, res in pairs(result) do
      -- Check if we have a valid result
      if res.result and not vim.tbl_isempty(res.result) then
        for _, r in pairs(res.result) do
          if r.edit then
            local client = vim.lsp.get_client_by_id(cid)
            local enc = client and client.offset_encoding or "utf-16"
            vim.lsp.util.apply_workspace_edit(r.edit, enc)
          end
        end
      end
    end

    -- Format the file
    vim.lsp.buf.format({ async = false })
  end,
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

-- Prevent highlighting AngularJs expressions  {{$ctrl}} as error
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

-- Blade file handling - consolidated
local blade_augroup = vim.api.nvim_create_augroup("blade_setup", { clear = true })
-- Set blade files to php initially for LSP
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = blade_augroup,
  pattern = "*.blade.php",
  callback = function()
    vim.bo.filetype = "php"
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "blade",
  callback = function()
    -- Set the Blade-specific comment string
    vim.opt_local.commentstring = "{{-- %s --}}"
  end,
})
-- Switch back to blade after LSP attaches and set folding
vim.api.nvim_create_autocmd("LspAttach", {
  group = blade_augroup,
  pattern = "*.blade.php",
  callback = function(args)
    vim.schedule(function()
      for _, client in ipairs(vim.lsp.get_clients()) do
        if client.name == "intelephense" and client.attached_buffers[args.buf] then
          vim.bo[args.buf].filetype = "blade"
          vim.bo[args.buf].syntax = "blade"
          vim.opt_local.foldmethod = "indent"
          break
        end
      end
    end)
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
