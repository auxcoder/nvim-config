-- Tree-sitter parsers to always keep installed.
--
-- nvim-treesitter is on the `main` branch (see lazy-lock.json). LazyVim declares
-- `opts_extend = { "ensure_installed" }`, so this list is MERGED with LazyVim's
-- defaults and with other specs (eta.lua, ruby-rails.lua) rather than replacing
-- them. Only list parsers that are NOT already in LazyVim's defaults to avoid
-- duplication (harmless, but keeps the list meaningful).
--
-- LazyVim already ensures: bash, c, diff, html, javascript, jsdoc, json, lua,
-- luadoc, luap, markdown, markdown_inline, printf, python, query, regex, toml,
-- tsx, typescript, vim, vimdoc, xml, yaml.
--
-- If an OS/Homebrew upgrade ever wipes the compiled parsers again, run
-- `:TSUpdate` (or restart Neovim) and every parser below will be rebuilt.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Web / templating
        "css",
        "blade",
        "php",
        "php_only",
        -- Config / infra
        "dockerfile",
        "git_config",
        "gomod",
        "gowork",
        "gosum",
        "json5",
        "ninja",
        "sql",
        -- Languages
        "go",
        "groovy",
        "kotlin",
        "ruby",
        "fish",
        "rst",
      },
    },
  },
}
