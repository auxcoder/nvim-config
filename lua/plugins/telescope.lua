return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  optional = true,
  keys = {
    -- open find project
    -- { "<leader>pp", "<cmd>Telescope projects<CR>", desc = "Find Projects" },
    -- change a keymap
    { "<C-p>", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
    -- add a keymap to browse plugin files
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
    -- This is using b because it used to be fzf's :Buffers
    {
      "<leader>b",
      "<cmd>Telescope oldfiles<cr>",
      desc = "Recent",
    },
  },
}
