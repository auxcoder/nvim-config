-- In your config/lazy.lua
return {
  "mfussenegger/nvim-lint",
  -- You can use `opts` to configure the linters
  opts = {
    linters_by_ft = {
      -- This applies to all PHP files, including Blade files. PHP CodeSniffer (phpcs) must install via Composer
      php = { "phpcs" },
      -- You can also add linters for other languages you use in Laravel
      javascript = { "eslint" },
      typescript = { "eslint" },
      css = { "stylelint" },
    },
    -- Optional: Configure the PHPCS executable and arguments
    linters = {
      phpcs = {
        -- You may need to specify the path to your phpcs executable if it's not in your PATH
        -- cmd = "path/to/phpcs",
        -- Crucial: Define the standard you want to check against (e.g., PSR12 or Laravel)
        args = { "--standard=PSR12", "$FILE" },
      },
    },
  },
}
