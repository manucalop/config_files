-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.cmd("au BufEnter *.py setlocal foldmethod=indent")
vim.cmd("au BufEnter *.lua setlocal foldmethod=marker")
vim.cmd("au BufEnter *.bash_aliases setlocal foldmethod=marker")
vim.cmd("au BufEnter *.tex setlocal wrap")
vim.cmd("au BufEnter *.md setlocal wrap")
vim.cmd("au BufEnter *.tex setlocal foldmethod=marker")
