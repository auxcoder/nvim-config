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

## Laravel Native

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

### Theme

- I concede, we are back to using catppuccin. There is just too many integrations.

## Troubleshooting

If opening a py file leads to pyright analyzing your whole library, make sure to add an empty `pyrightconfig.json` into the file root.
This can be your $HOME folder or for example on darwin using homebrew it could be `/opt/homebrew/`.

## Config Refs

- [BarbaricLazyVim - LazyVim Config](https://github.com/Vintharas/BarbaricLazyVim)
- [JazzyGrim - dotfiles](https://github.com/JazzyGrim/dotfiles/tree/master/.config/nvim)
