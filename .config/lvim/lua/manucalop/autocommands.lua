vim.cmd("au BufEnter *.py setlocal foldmethod=indent")
vim.cmd("au BufEnter *.lua setlocal foldmethod=marker")
vim.cmd("au BufEnter *.bash_aliases setlocal foldmethod=marker")
-- vim.cmd("au BufWritePre * :silent! Neoformat")
