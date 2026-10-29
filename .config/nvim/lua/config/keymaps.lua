local wk = require("which-key")
local telescope = require("telescope.builtin")
local dap = require("dap")
local fterm = require("FTerm")

wk.add({
  -- LSP
  { "<Leader>k",  group = "LSP stuff" },
  { "<Leader>kh", vim.lsp.buf.hover,                                   desc = "Hover" },
  { "<Leader>kd", vim.lsp.buf.definition,                              desc = "Go to definition" },
  { "<Leader>ka", vim.lsp.buf.code_action,                             desc = "Code action" },
  { "<Leader>kR", vim.lsp.buf.rename,                                  desc = "Rename" },
  { "<Leader>kr", vim.lsp.buf.references,                              desc = "References" },
  { "<Leader>kf", function() vim.lsp.buf.format({ async = true }) end, desc = "Format buffer" },
  { "<Leader>ke", vim.diagnostic.open_float,                           desc = "Diagnostic float" },

  -- Find
  { "<Leader>f",  group = "Find" },
  { "<Leader>ff", telescope.find_files,                                desc = "Find file" },
  { "<Leader>fg", telescope.live_grep,                                 desc = "Live grep" },

  -- File tree
  { "<leader>n",  "<Cmd>Neotree filesystem reveal left<CR>",            desc = "Reveal file tree" },
  { "<leader>N",  "<Cmd>Neotree filesystem reveal left toggle<CR>",      desc = "Toggle file tree" },

  -- Debugger (leader variants alongside F-keys)
  { "<Leader>d",  group = "Debugging" },
  { "<Leader>db", dap.toggle_breakpoint,                               desc = "Toggle breakpoint" },
  { "<Leader>dc", dap.continue,                                        desc = "Continue" },
  { "<Leader>dx", dap.step_over,                                       desc = "Step over" },
  { "<Leader>dz", dap.step_into,                                       desc = "Step into" },
  { "<Leader>dv", dap.step_out,                                        desc = "Step out" },

  -- LazyGit
  { "<leader>g",  "<Cmd>LazyGit<cr>",                                  desc = "LazyGit" },

  -- Terminal
  { "<Leader>t",  function() fterm.toggle() end,                        desc = "Toggle terminal" },

  -- Buffers
  { "<Leader>b",  group = "Buffers" },
  { "<Leader>bq", "<Cmd>BufferClose<cr>",                              desc = "Close buffer" },
  { "<Leader>bQ", "<Cmd>BufferClose!<cr>",                             desc = "Force close buffer" },
  { "<Leader>bU", "<Cmd>bufdo bd<cr>",                                 desc = "Close all buffers" },
  { "<Leader>bv", "<Cmd>vsplit<CR><Cmd>bnext<CR>",                     desc = "Vertical split next buffer" },

  { "<A-]>",      "<Cmd>bnext<cr>",                                    desc = "Next buffer" },
  { "<A-[>",      "<Cmd>bprevious<cr>",                                desc = "Previous buffer" },
  { "<A-1>",      "<Cmd>BufferGoto 1<CR>",                             hidden = true },
  { "<A-2>",      "<Cmd>BufferGoto 2<CR>",                             hidden = true },
  { "<A-3>",      "<Cmd>BufferGoto 3<CR>",                             hidden = true },
  { "<A-4>",      "<Cmd>BufferGoto 4<CR>",                             hidden = true },
  { "<A-5>",      "<Cmd>BufferGoto 5<CR>",                             hidden = true },
  { "<A-6>",      "<Cmd>BufferGoto 6<CR>",                             hidden = true },
  { "<A-7>",      "<Cmd>BufferGoto 7<CR>",                             hidden = true },
  { "<A-8>",      "<Cmd>BufferGoto 8<CR>",                             hidden = true },
  { "<A-9>",      "<Cmd>BufferGoto 9<CR>",                             hidden = true },
  { "<A-0>",      "<Cmd>BufferLast<CR>",                               hidden = true },

  -- Git hunks
  { "<Leader>h",  group = "Hunk" },
  { "<Leader>hs", function() require("gitsigns").stage_hunk() end,      desc = "Stage hunk" },
  { "<Leader>hr", function() require("gitsigns").reset_hunk() end,      desc = "Reset hunk" },
  { "<Leader>hp", function() require("gitsigns").preview_hunk() end,    desc = "Preview hunk" },
  { "<Leader>hn", function() require("gitsigns").nav_hunk("next") end,  desc = "Next hunk" },
  { "<Leader>hN", function() require("gitsigns").nav_hunk("prev") end,  desc = "Prev hunk" },
})

-- nvim <-> tmux split navigation (Alt+hjkl)
for _, nav in ipairs({ { "h", "Left" }, { "j", "Down" }, { "k", "Up" }, { "l", "Right" } }) do
  local key, direction = nav[1], nav[2]
  vim.keymap.set({ "n", "v" }, "<A-" .. key .. ">", "<Cmd>NvimTmuxNavigate" .. direction .. "<CR>")
end

-- exit terminal insert mode without closing the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
