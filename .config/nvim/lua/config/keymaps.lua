local wk = require("which-key")
local telescope = require("telescope.builtin")
local dap = require("dap")

wk.add({
  {
    -- LSP Stuff
    { "<Leader>k",  group = "LSP stuff" },
    { "<Leader>kh", vim.lsp.buf.hover,                            desc = "Hover buffer" },
    { "<Leader>kd", vim.lsp.buf.definition,                       desc = "Go to definition" },
    { "<Leader>ka", vim.lsp.buf.code_action,                      desc = "Code action" },
    { "<Leader>kR", vim.lsp.buf.rename,                           desc = "Rename all reference" },
    { "<Leader>kr", vim.lsp.buf.references,                       desc = "List all references" },
    { "<Leader>kf", vim.lsp.buf.format,                           desc = "Format current buffer" },

    -- diagnostics
    { "<Leader>kd", vim.diagnostic.show,                          desc = "Show diagnostics" },

    -- Which Key
    --{"<Leader>?", wk.show({ global = false }),desc = "Buffer Local Keymaps (which-key)",},

    -- Telescope
    { "<Leader>f",  group = "Find" },
    { "<Leader>ff", telescope.find_files,                         desc = "Find file" },
    { "<Leader>fg", telescope.live_grep,                          desc = "Live grep" },

    -- Neotree
    { "<leader>n",  ":Neotree filesystem reveal left<CR>",        desc = "Go to file tree" },
    { "<leader>N",  ":Neotree filesystem reveal left toggle<CR>", desc = "Toggle file tree" },

    -- Debugger
    { "<Leader>d",  group = "Debugging" },
    { "<Leader>db", dap.toggle_breakpoint,                        desc = "Toggle breakpoint" },
    { "<Leader>dc", dap.continue,                                 desc = "Continue in debug" },
    { "<Leader>dx", dap.step_over,                                desc = "Step over" },
    { "<Leader>dz", dap.step_into,                                desc = "Step into" },
    { "<Leader>dv", dap.step_out,                                 desc = "Step out" },

    -- LazyGit
    { "<leader>g",  "<cmd>LazyGit<cr>",                           desc = "LazyGit" },

    -- Ftrem
    { "<Leader>t",  "<cmd>lua require('FTerm').toggle()<cr>",     desc = "Toggle terminal" },

    -- BarBar/Buffers
    { "<Leader>b",  group = "Buffers" },
    { "<Leader>bq", ":BufferClose<cr>",                           desc = "Close Buffer" },
    { "<Leader>bQ", ":BufferClose!<cr>",                          desc = "Force Close Buffer" },
    { "<Leader>bU", "::bufdo bd<CR>",                             desc = "Close All Buffer" },
    { "<Leader>bv", ":vsplit<CR>:bnext<CR>",                      desc = "Verstical Split New Buffer" },

    { "<AS-]>",     ":bnext<cr>",                                 desc = "Next buffer" },
    { "<AS-[>",     ":bprevious<cr>",                             desc = "Previous buffer" },
    { "<AS-1>",     "<Cmd>BufferGoto 1<CR>" },
    { "<AS-2>",     "<Cmd>BufferGoto 2<CR>" },
    { "<AS-3>",     "<Cmd>BufferGoto 3<CR>" },
    { "<AS-4>",     "<Cmd>BufferGoto 4<CR>" },
    { "<AS-5>",     "<Cmd>BufferGoto 5<CR>" },
    { "<AS-6>",     "<Cmd>BufferGoto 6<CR>" },
    { "<AS-7>",     "<Cmd>BufferGoto 7<CR>" },
    { "<AS-8>",     "<Cmd>BufferGoto 8<CR>" },
    { "<AS-9>",     "<Cmd>BufferGoto 9<CR>" },
  },
  {
    mode = "t",
    { "<Esc>", "<C-\\><C-n><CMD>lua require('FTerm').close()<CR>" },
  },
  {
    mode = "n",
    {
      "<Leader>h", "<Cmd>NvimTmuxNavigateLeft<CR>"
    },
    { "<Leader>j", "<Cmd>NvimTmuxNavigateDown<CR>"},
    {"<Leader>k", "<Cmd>NvimTmuxNavigateUp<CR>"},
    {"<Leader>l", "<Cmd>NvimTmuxNavigateRight<CR>"},
  },
})
