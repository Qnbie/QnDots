local augroup = vim.api.nvim_create_augroup("user_config", { clear = true })

-- linting when file is written to
vim.api.nvim_create_autocmd("BufWritePost", {
  group = augroup,
  callback = function()
    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype, on write
    require("lint").try_lint()
  end,
})

-- spellcheck in md
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "markdown",
  command = "setlocal spell wrap",
})

-- disable automatic comment on newline
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- highlight text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.hl.on_yank({ timeout = 300 })
  end,
})

-- restore cursor pos on file open
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  pattern = "*",
  callback = function()
    local line = vim.fn.line("'\"")
    if line > 1 and line <= vim.fn.line("$") then
      vim.cmd("normal! g'\"")
    end
  end,
})

-- auto-create missing dirs when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  pattern = "*",
  callback = function()
    if vim.bo.buftype ~= "" then
      return
    end
    local dir = vim.fn.expand("<afile>:p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})
