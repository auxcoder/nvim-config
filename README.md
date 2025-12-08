# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Essential External Tools Check

Remember that the NeoVim plugins act as interfaces; the actual heavy lifting is done by external programs that you need installed on your system.

```bash
# Install PHP CodeSniffer (for linting)
composer global require "squizlabs/php_codesniffer=*"

# Install PHP-CS-Fixer (for formatting)
composer global require friendsofphp/php-cs-fixer
# OR if you prefer Laravel's built-in formatter:
# composer global require laravel/pint
```

Install via NPM (Blade Formatting)

```bash
# Install Blade Formatter (for .blade.php formatting)
npm install -g @shufo/blade-formatter
```
