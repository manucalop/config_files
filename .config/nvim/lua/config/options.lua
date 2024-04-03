-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local brew_dir = vim.fn.system("brew --prefix"):gsub("\n", "")

vim.g.python3_host_prog = brew_dir .. "/bin/python3"
vim.g.python3_host_prog_pip = brew_dir .. "/bin/pip3"
