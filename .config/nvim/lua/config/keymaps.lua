local wk = require("which-key")
local telescope = require("telescope.builtin")
local dap = require("dap")

wk.add({

  -- LSP Stuff
  { "<Leader>k",  group = "LSP stuff" },
  { "<Leader>kh", vim.lsp.buf.hover,        desc = "Hover buffer" },
  { "<Leader>kd", vim.lsp.buf.definition,   desc = "Go to definition" },
  { "<Leader>ka", vim.lsp.buf.code_action,  desc = "Code action" },
  { "<Leader>kR", vim.lsp.buf.rename,       desc = "Rename all reference" },
  { "<Leader>kr", vim.lsp.buf.references,   desc = "List all references" },
  { "<Leader>kf", vim.lsp.buf.format,       desc = "Format current buffer" },

  -- diagnostics
  { "<Leader>kd", vim.diagnostic.show,      desc = "Show diagnostics" },

  -- Which Key
  --{"<Leader>?", wk.show({ global = false }),desc = "Buffer Local Keymaps (which-key)",},

  -- Telescope
  { "<Leader>f",  group = "Find" },
  { "<Leader>ff", telescope.find_files,                          desc = "Find file" },
  { "<Leader>fg", telescope.live_grep,                           desc = "Live grep" },

  -- Neotree
  { "<leader>n",  ":Neotree filesystem reveal left<CR>",         desc = "Go to file tree" },
  { "<leader>N",  ":Neotree filesystem reveal left toggle<CR>",  desc = "Toggle file tree" },

  -- Debugger
  { "<Leader>d",  group = "Debugging" },
  { "<Leader>db", dap.toggle_breakpoint,                         desc = "Toggle breakpoint" },
  { "<Leader>dc", dap.continue,                                  desc = "Continue in debug" },
  { "<Leader>dx", dap.step_over,                                 desc = "Step over" },
  { "<Leader>dz", dap.step_into,                                 desc = "Step into" },
  { "<Leader>dv", dap.step_out,                                  desc = "Step out" },

  -- LazyGit
  { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
})
