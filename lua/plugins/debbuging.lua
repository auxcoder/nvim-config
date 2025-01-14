return {
  'mfussenegger/nvim-dap',
  dependencies = { 'rcarriga/nvim-dap-ui' },
  config = function()
    local dap, dapui = require("dap"), require("dapui")
    dap.adapters.php = {
      type = 'executable',
      command = 'node',
      args = { '/usr/local/lib/node_modules/vscode-php-debug/out/debugAdapter.js' }
    }
    dap.configurations.php = {
      {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9003
      }
    }
    -- use nvim-dap events to open and close
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    -- https://github.com/mfussenegger/nvim-dap/blob/master/doc/dap.txt
    vim.keymap.set('n', '<Leader>dt', function() dap.toggle_breakpoint() end)
    vim.keymap.set('n', '<Leader>dc', function() dap.continue() end)
    vim.keymap.set('n', '<Leader>db', function() dap.set_breakpoint() end)
  end
}
