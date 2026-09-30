-- Eta template support (.eta files)
-- Eta uses EJS-like syntax: <%= %>, <%~ %>, <% %>
return {
  -- Treesitter: use embedded_template parser for .eta files
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure the embedded_template parser is installed
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "embedded_template" })

      -- Map the 'eta' filetype to the 'embedded_template' parser
      vim.treesitter.language.register("embedded_template", "eta")
    end,
  },
}
