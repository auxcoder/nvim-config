return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- Ensure highlighting is still enabled
      highlight = { enable = true },
      indent = {
        enable = true,
        disable = { "php" },
      },
      ensure_installed = {
        "php",
        "blade",
        "html",
        "javascript",
        "css",
        "groovy",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    -- ensures this table's config runs only for these filetypes
    ft = { "groovy", "gradle", "jenkinsfile" },
    config = function()
      -- files like 'Jenkinsfile' and '*.gradle' are treated as 'groovy'
      vim.filetype.add({
        pattern = {
          ["Jenkinsfile"] = "groovy",
          ["Jenkinsfile-.*"] = "groovy",
          --  [".*\\.gradle"] = "groovy",
        },
      })
    end,
  },
}
