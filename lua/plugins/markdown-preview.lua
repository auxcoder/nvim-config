return {
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    -- build = "cd app && npm install",
    init = function()
      -- or your browser
      -- vim.g.mkdp_browser = "firefox"
      -- inject bootstrap v5
      vim.g.mkdp_markdown_css = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    end,
  },
}
