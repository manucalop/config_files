vim.cmd("au BufWritePre * :silent! Neoformat")
vim.cmd("au BufEnter *.py :let b:neoformat_run_all_formatters = 1")
vim.g.neoformat_enabled_python = {'black', 'isort', 'docformatter'}
