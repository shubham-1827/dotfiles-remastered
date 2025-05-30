return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",            -- pretty UI
    "nvim-neotest/nvim-nio",           -- needed for dap-ui
    "mfussenegger/nvim-dap-python",    -- for python debugger debugpy
    "jbyuki/one-small-step-for-vimkind", -- for debugging lua in neovim
  },

  config = function()
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup()

    -- automatically open and closes dap ui
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

    dap.adapters.codelldb = {
      type = "executable",
      command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"

      -- On windows you may have to uncomment this:
      -- detached = false,
    }

    dap.configurations.cpp = {
      {
        name = "Build & Launch current file",
        type = "codelldb",
        request = "launch",
        program = function()
          local file = vim.fn.expand("%:p")
          local output = vim.fn.getcwd() .. "/a.out"
          local compile_cmd = string.format("g++ -g %s -o %s", file, output)
          print("[DAP] Compiling: " .. compile_cmd)
          local result = os.execute(compile_cmd)
          if result ~= 0 then
            vim.notify("[DAP] Compilation failed!", vim.log.levels.ERROR)
            return nil
          end
          return output
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }

    dap.configurations.c = dap.configurations.cpp

    -- Keybindings to work with the DAP
    vim.keymap.set("n", "<F8>", function()
      dap.continue()
    end, { desc = "DAP: Start/Continue" })
    vim.keymap.set("n", "<F7>", function()
      dap.step_over()
    end, { desc = "DAP: Step Over" })
    vim.keymap.set("n", "<F6>", function()
      dap.step_into()
    end, { desc = "DAP: Step Into" })
    vim.keymap.set("n", "<F5>", function()
      dap.step_out()
    end, { desc = "DAP: Step Out" })

    vim.keymap.set("n", "<Leader>db", function()
      dap.toggle_breakpoint()
    end, { desc = "DAP: Toggle Breakpoint" })
    vim.keymap.set("n", "<Leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "DAP: Set Conditional Breakpoint" })
    vim.keymap.set("n", "<Leader>dp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, { desc = "DAP: Set Log Point" })

    vim.keymap.set("n", "<Leader>dr", function()
      dap.repl.open()
    end, { desc = "DAP: Open REPL" })
    vim.keymap.set("n", "<Leader>dl", function()
      dap.run_last()
    end, { desc = "DAP: Run Last Debug Session" })
    vim.keymap.set("n", "<Leader>de", function()
      dap.terminate()
      dapui.close()
    end, { desc = "DAP: Terminate + Close UI" })

    -- DAP-UI Controls
    vim.keymap.set("n", "<Leader>du", function()
      dapui.toggle()
    end, { desc = "DAP-UI: Toggle UI" })
    vim.keymap.set("n", "<Leader>dv", function()
      dapui.eval()
    end, { desc = "DAP-UI: Eval variable under cursor" })
  end,
}
