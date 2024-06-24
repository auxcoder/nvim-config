return {
  {
    "heavenshell/vim-jsdoc",
    config = function()
      vim.g.vim_jsdoc_type = "JSDoc"
      vim.g.vim_jsdoc_template = "/**\n * $1\n */"
    end,
    -- opts = {
    --   ft = { "javascript", "javascript.jsx", "typescript" },
    --   build = "cd app && npm install",
    -- },
  },
}
