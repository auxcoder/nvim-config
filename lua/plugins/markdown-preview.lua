return {
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    -- build = "cd app && npm install",
    init = function()
      -- vim.g.mkdp_browser = "firefox" -- or your browser
      -- vim.g.mkdp_preview_options = {
      --   disable_sync_scroll = 0,
      --   hide_yaml_meta = 1,
      -- }
      -- inject bootstrap v5
      vim.g.mkdp_markdown_css = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    end,
  },
}
