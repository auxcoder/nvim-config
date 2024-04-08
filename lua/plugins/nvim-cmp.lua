return {
  "nvim-cmp",
  opts = function(_, opts)
    table.insert(opts.sources, 1, {
      name = "codeium", -- copilot, codeium
      group_index = 2,
      priority = 100,
    })
  end,
}
