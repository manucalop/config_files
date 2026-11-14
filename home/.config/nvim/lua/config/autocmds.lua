-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`

vim.cmd("au BufEnter *.tex setlocal wrap")
vim.cmd("au BufEnter *.md setlocal nowrap")

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = "*.sql.j2",
  callback = function()
    vim.bo.filetype = "sql"
  end,
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = "*.sqlfluff",
  callback = function()
    vim.bo.filetype = "toml"
  end,
})
