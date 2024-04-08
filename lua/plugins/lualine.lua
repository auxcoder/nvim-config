return {
  {
    "lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 2, require("lazyvim.util").lualine.cmp_source("codeium"))
    end,
  },
}
