return {
  "tkhren/vim-fake",
  config = function()
    _G.Fake = function(type)
      return vim.fn["fake#gen"](type)
    end

    -- Minimum length for generated words (default is usually 3)
    vim.g.fake_word_min_len = 5
    -- Maximum length for generated words
    vim.g.fake_word_max_len = 20
  end,
}
