return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- Ensure js-debug-adapter is installed via Mason
      {
        "mason-org/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { "js-debug-adapter" })
        end,
      },
    },
    config = function()
      local dap = require("dap")

      -- Register js-debug directly (replaces the archived nvim-dap-vscode-js).
      -- nvim-dap starts the adapter as a DAP server on a random ${port}.
      for _, adapter in ipairs({ "pwa-node", "pwa-chrome" }) do
        dap.adapters[adapter] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            -- Mason's bin dir is on nvim's PATH; this shim launches dapDebugServer.js
            command = "js-debug-adapter",
            args = { "${port}" },
          },
        }
      end

      local js_langs = { "javascript", "typescript", "javascriptreact", "typescriptreact" }
      local skip = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" }

      for _, lang in ipairs(js_langs) do
        dap.configurations[lang] = {
          -- Debug the current Node.js file
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            skipFiles = skip,
          },
          -- Attach to a running Node.js process (started with --inspect)
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach to process",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            skipFiles = skip,
          },
          -- Debug Jest tests
          {
            type = "pwa-node",
            request = "launch",
            name = "Debug Jest tests",
            runtimeExecutable = "node",
            runtimeArgs = { "--inspect-brk", "${workspaceFolder}/node_modules/.bin/jest", "--runInBand" },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
            sourceMaps = true,
          },
          -- Debug browser JS via Chrome
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch Chrome (localhost:3000)",
            url = "http://localhost:3000",
            webRoot = "${workspaceFolder}",
            sourceMaps = true,
          },
        }
      end
    end,
  },
}
