-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<C-c>", "<cmd>q<CR>", { desc = "Quit" })
map("n", "K", "O<Esc>j", { desc = "Insert newline above" })
map("n", "J", "o<Esc>k", { desc = "Insert newline below" })
map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover" })
map("n", "gH", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Signature Help" })

-- Buffers
map("n", "<C-n>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
map("n", "<C-p>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
map("n", "<S-l>", "<cmd>BufferLineMoveNext<CR>", { desc = "Move Buffer Right" })
map("n", "<S-h>", "<cmd>BufferLineMovePrev<CR>", { desc = "Move Buffer Left" })

-- Increment/Decrement
map("n", "<C-a>", "<Nop>", { noremap = true, silent = true })
map("n", "<C-x>", "<Nop>", { noremap = true, silent = true })
map("n", "=", "<C-a>", { noremap = true, silent = true })
map("n", "-", "<C-x>", { noremap = true, silent = true })

-- For filetype sql map C-Enter to run query with dadbod-ui
-- map("v", "<Leader><S>", "<Plug>(DBUI_ExecuteQuery)", { noremap = true, silent = true })
