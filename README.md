# Readme

## Reinstall & Force config

As `LazyVim` uses `Lazy` package manager all its plugins are installed under folder:

```sh
~/.local/share/nvim/lazy/
```

Some times is needed to force install config, so removing folder `/nvim` will force **Neovim** to reinstall all its config dependencies.

## 💤 LazyVim + Laravel

This is my best effort to fully integrate my LazyVim config with Laravel and all Laravel-related tools.
Functional Volt works, too, but has issues with `$this`.

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

- [heavenshell/vim-jsdoc](https://github.com/heavenshell/vim-jsdoc)

## Laravel

This config is setup with the best available dev tooling for laravel

- Intelephense
- Blade Language Support
- Blade Formatter
- Pint
- Phpstan (make sure you configure larastan in your project)
- Rustywind
- Tailwind LS
- XDebug with configuration for Laravel Sail
- Treesitter beta for blade files included

---

Used in the past and removed due errors

- [laravel.vim](https://github.com/adalessa/laravel.nvim)

With config

```lua
return {
  {
    -- Add the Laravel.nvim plugin which gives the ability to run Artisan commands
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
      "nvimtools/none-ls.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>" },
      { "<leader>lr", ":Laravel routes<cr>" },
      { "<leader>lm", ":Laravel related<cr>" },
    },
    event = { "VeryLazy" },
    config = true,
  },
  {
    -- Add the blade-nav.nvim plugin which provides Goto for Blade files.
    "ricardoramirezr/blade-nav.nvim",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    ft = { "blade", "php" },
  },
}
```

## Git integrations

- [The Holy Grail of Neovim Git Integrations](https://www.youtube.com/watch?v=K-FKqXj8BAQ)

  - [LazyGit](https://youtu.be/K-FKqXj8BAQ?t=100)
  - [Fugitive](https://youtu.be/K-FKqXj8BAQ?t=222)
  - [NeoGit](https://youtu.be/K-FKqXj8BAQ?t=347)
  - [DiffView](https://youtu.be/K-FKqXj8BAQ?t=537)

- [LazyVim - A beautiful neovim config for the lazy](https://www.barbarianmeetscoding.com/notes/neovim-lazyvim/)
  - [lazyGit - Video tutorial](https://www.youtube.com/watch?v=CPLdltN7wgE)
    - [LazyGit - Resolve Conflicts Tutorial](https://www.youtube.com/watch?v=CPLdltN7wgE)

## Php

### Requirements

If you encounter an issue with `Intelephense` not recognising facade or model function calls, you will need to install [Laravel IDE Helper](https://github.com/barryvdh/laravel-ide-helper) into your project and execute the relevant artisan commands. Thanks to [@ermand](https://github.com/ermand) for bringing up the issue as well as the solution.

Make sure you install all TreeSitter parsers by doing:

`:TSInstall all` and `:TSInstall php_only`.

This will install both the experimental blade parser, for which configuration is included in this config, as well as the php_only parser, which is needed for it to work fully.
For some reason php_only is not included in `all`.

Optional:

- lazygit
- lazydocker

(you should use both, they are great)

### LSP

- Tailwind support
- Intelephense for php (best in class for Laravel development)

## Troubleshooting

If opening a py file leads to pyright analyzing your whole library, make sure to add an empty `pyrightconfig.json` into the file root.
This can be your $HOME folder or for example on darwin using homebrew it could be `/opt/homebrew/`.

## Config Refs

- [BarbaricLazyVim - LazyVim Config](https://github.com/Vintharas/BarbaricLazyVim)
- [JazzyGrim - dotfiles](https://github.com/JazzyGrim/dotfiles/tree/master/.config/nvim)

## DAP

### JavaScript

- [How I configured nvim-dap to Debug Node.js Apps](https://www.youtube.com/watch?v=Ul_WPhS2bis)
  - [config](https://github.com/nikolovlazar/dotfiles/tree/92c91ed035348c74e387ccd85ca19a376ea2f35e/.config/nvim):whole

### PHP

- Intelephense / Phpactor

| Feature             | Intelephense           | Phpactor                 |
| :------------------ | :--------------------- | :----------------------- |
| Ease of Setup       | Easier                 | Requires config          |
| Performance         | Fast                   | Slower                   |
| Refactoring Support | Limited (paid)         | Rich (built-in)          |
| Customization       | Minimal                | Highly extensible        |
| Framework Awareness | Good                   | Less automatic           |
| Best for            | General usage, VS Code | Vim/Neovim + power users |

- xdebug

Install the Debug Adapter Globally

```sh
npm install -g https://github.com/xdebug/vscode-php-debug
```

Find the Global Path

```sh
npm list -g --depth=0
/usr/local/lib
├── @angular/cli@9.0.6
├── php-debug@
└── wml@0.0.83
```

Configure DAP

```lua
-- global install
args = { '/home/username/.npm-global/lib/node_modules/vscode-php-debug/out/phpDebug.js' }
-- system wide
args = { '/usr/local/lib/node_modules/vscode-php-debug/out/phpDebug.js' }
```

## Install the PHP adapter

You need to manually clone and build vscode-php-debug:

```sh
git clone https://github.com/xdebug/vscode-php-debug.git ~/.local/share/nvim/php-debug
cd ~/.local/share/nvim/php-debug
npm install
npm run build
```

## Configure nvim-dap for PHP

Here’s a ready-to-use config you can paste in your Neovim:

```lua
local dap = require('dap')

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/.local/share/nvim/php-debug/out/phpDebug.js' },
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9003, -- Xdebug 3 default port
    pathMappings = {
      ["/var/www/html"] = "${workspaceFolder}",
    },
  },
}

```
