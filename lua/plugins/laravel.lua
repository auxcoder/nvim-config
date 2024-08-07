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
    opts = {
      lsp_server = "intelephense", -- "phpactor"
      features = { null_ls = { enable = false } },
      -- intelephense = {
      --      stubs = {
      --        "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl", "date",
      --        "dba", "dom", "enchant", "exif", "fileinfo", "filter", "fpm", "ftp", "gd", "hash",
      --        "iconv", "imap", "intl", "json", "ldap", "libxml", "mbstring", "mcrypt", "mysql", "mysqli",
      --        "oci8", "odbc", "openssl", "pdo", "pgsql", "phar", "phpdbg", "posix", "pspell", "readline",
      --        "recode", "reflection", "session", "shmop", "simplexml", "snmp", "soap", "sockets", "sodium",
      --        "spl", "sqlite3", "standard", "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy", "tokenizer",
      --        "xml", "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib",
      --        "redis", "laravel"
      --      },
      --      files = {
      --        maxSize = 5000000;
      --      };
      --      -- environment = {
      --      --    phpVersion = "8.1.0",
      --      -- };
      -- },
    },
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
