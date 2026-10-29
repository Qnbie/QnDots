return {
  "alexghergh/nvim-tmux-navigation",
  lazy = false,
  config = function()
    -- creates the NvimTmuxNavigate* commands used by config/keymaps.lua
    require("nvim-tmux-navigation").setup({})
  end,
}
