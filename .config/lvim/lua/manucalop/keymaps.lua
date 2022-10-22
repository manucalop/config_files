-- Saving
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- Closing
lvim.keys.normal_mode["<C-c>"] = ":q<cr>"
-- Find files
lvim.keys.normal_mode["<C-f>"] = ":Telescope find_files<cr>"
-- Formatting
lvim.builtin.which_key.mappings["f"] = { ":lua vim.lsp.buf.format()<cr>", "Format" }


-- Move around wrapped lines
lvim.keys.normal_mode["j"] = "gj"
lvim.keys.normal_mode["k"] = "gk"
lvim.keys.visual_mode["j"] = "gj"
lvim.keys.visual_mode["k"] = "gk"

-- Fast cursor movement
lvim.keys.normal_mode["<c-j>"] = "5j"
lvim.keys.normal_mode["<c-k>"] = "5k"
lvim.keys.visual_mode["<c-j>"] = "5j"
lvim.keys.visual_mode["<c-k>"] = "5k"

-- Hover
lvim.lsp.buffer_mappings.normal_mode["<c-h>"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show hover" }
lvim.lsp.buffer_mappings.normal_mode["K"]     = nil

-- Create empty lines above and below
lvim.keys.normal_mode["K"] = "O<Esc>j"
lvim.keys.normal_mode["J"] = "o<Esc>k"

-- Keep buffer when pasting
lvim.builtin.which_key.mappings["v"] = { "\"_dP", "Paste again" }
lvim.keys.visual_mode["<leader>v"] = "\"_dP"
-- lvim.keys.normal_mode["<leader>p"] = "\"_dP"
-- lvim.keys.visual_mode["<leader>p"] = "\"_dP"


-- Copying to/from System Clipboard
lvim.builtin.which_key.mappings["y"] = { '"+y', "Copy to clipboard" }
lvim.builtin.which_key.mappings["Y"] = { '"+Y', "Copy line to clipboard" }
lvim.keys.visual_mode["<leader>y"] = '"+y'

-- Move between buffers
lvim.builtin.which_key.mappings["b"] = { "<cmd>Telescope buffers<cr>", "Buffers" }
lvim.builtin.which_key.mappings["p"] = { ":bprevious<cr>", "Previous Buffer" }
lvim.builtin.which_key.mappings["n"] = { ":bnext<cr>", "Next Buffer" }

-- Delete all buffer except the current one
lvim.builtin.which_key.mappings["C"] = { ":%bd|e#|bd#<CR>", "Close all buffers" }

-- Make current file executable
lvim.builtin.which_key.mappings["x"] = { ":!chmod +x %<cr>", "Make executable" }

-- Telescope
lvim.builtin.which_key.mappings["/"] = { "<cmd>Telescope live_grep<cr>", "Search" }

-- Harpoon
lvim.builtin.which_key.mappings["i"] = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon" }
lvim.builtin.which_key.mappings["a"] = { ":lua require('harpoon.mark').add_file()<cr>", "Harpoon Add" }
lvim.builtin.which_key.mappings["hi"] = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon" }
lvim.builtin.which_key.mappings["ha"] = { ":lua require('harpoon.mark').add_file()<cr>", "Harpoon Add" }
lvim.builtin.which_key.mappings["hn"] = { ":lua require('harpoon.ui').nav_next()<cr>", "Harpoon Next" }
lvim.builtin.which_key.mappings["hp"] = { ":lua require('harpoon.ui').nav_prev()<cr>", "Harpoon Prev" }
lvim.builtin.which_key.mappings["ht"] = { ":lua require('harpoon.tmux').gotoTerminal('{down-of}')<cr>", "Harpoon Terminal" }

-- Neogit
lvim.builtin.which_key.mappings["gn"] = { ":Neogit<cr>", "Neogit" }
