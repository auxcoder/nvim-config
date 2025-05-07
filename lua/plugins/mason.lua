return {
  "williamboman/mason.nvim",
  config = function()
    -- import mason
    local mason = require("mason")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
  end,
  opts = {
    ensure_installed = {
      "actionlint",
      "ansible-language-server",
      "ansible-lint",
      "antlers-language-server",
      "bash-language-server",
      "blade-formatter",
      "docker-compose-language-service",
      "dockerfile-language-server",
      "dot-language-server",
      "emmet-ls",
      "eslint_d",
      "flake8",
      -- go stuff
      "goimports",
      "gofumpt",
      "gomodifytags",
      "impl",
      "hadolint",
      "html-lsp",
      "intelephense",
      "nginx-language-server",
      -- php stuff
      "php-debug-adapter",
      "phpcs",
      "php-cs-fixer",
      -- "phpstan",
      -- "pint",
      -- css, js, json
      "eslint_d", -- js linter
      "prettier", -- prettier formatter
      "rustywind",
      "tailwindcss-language-server",
      -- "prettierd",
      -- python
      -- "black",
      -- "isort",
      -- "pyright",
      -- "pylint", -- python linter
      "shellcheck",
      "shfmt",
      "stylua",
    },
  },
}
