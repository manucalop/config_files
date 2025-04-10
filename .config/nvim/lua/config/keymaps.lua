-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map({ "n" }, "<C-c>", "<cmd>q<CR>", { desc = "Quit" })
map({ "n" }, "<C-n>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
map({ "n" }, "<C-p>", "<cmd>bprev<CR>", { desc = "Previous Buffer" })

map({ "n" }, "K", "O<Esc>j", { desc = "Insert newline above" })
map({ "n" }, "J", "o<Esc>k", { desc = "Insert newline below" })
map({ "n" }, "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover" })
map({ "n" }, "gH", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { desc = "Signature Help" })

map("n", "<c-a>", "<nop>")
map("n", "<c-x>", "<nop>")
map("n", "<c-a>", "<nop>")
map("n", "<c-x>", "<nop>")

-- Increment/Decrement
map("n", "<C-a>", "<Nop>", { noremap = true, silent = true })
map("n", "<C-x>", "<Nop>", { noremap = true, silent = true })

map("n", "=", "<C-a>", { noremap = true, silent = true })
map("n", "-", "<C-x>", { noremap = true, silent = true })
