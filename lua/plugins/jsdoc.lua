return {
  {
    "heavenshell/vim-jsdoc",
    config = function()
      vim.g.vim_jsdoc_type = "JSDoc"
      vim.g.vim_jsdoc_template = "/**\n * $1\n */"
    end,
  },
}
