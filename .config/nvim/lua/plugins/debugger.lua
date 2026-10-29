return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")

      dapui.setup()

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

      -- no adapters configured yet; add one when a debug target is needed
      local map = vim.keymap.set
      map("n", "<F5>", dap.continue, { desc = "Debug: continue" })
      map("n", "<F10>", dap.step_over, { desc = "Debug: step over" })
      map("n", "<F11>", dap.step_into, { desc = "Debug: step into" })
      map("n", "<F12>", dap.step_out, { desc = "Debug: step out" })
      map("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Debug: toggle breakpoint" })
      map("n", "<Leader>dB", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "Debug: conditional breakpoint" })
      map("n", "<Leader>du", dapui.toggle, { desc = "Debug: toggle UI" })
      map("n", "<Leader>dr", dap.repl.toggle, { desc = "Debug: toggle REPL" })
      map("n", "<Leader>dl", dap.run_last, { desc = "Debug: run last" })
    end,
  },
}
