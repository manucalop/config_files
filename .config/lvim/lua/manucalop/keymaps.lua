-- Saving
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- Closing
lvim.keys.normal_mode["<C-c>"] = ":q<cr>"

-- Formatting
-- Function to toggle an autocommand that formats the file on save
-- local toggle_format_on_save = function()
--   local format_on_save = false
--   return function()
--     format_on_save = not format_on_save
--     if format_on_save then
--       vim.cmd("au BufWritePre * :silent! lua vim.lsp.buf.format()")
--       print("Format on save enabled")
--     else
--       vim.cmd("au! BufWritePre * :silent! lua vim.lsp.buf.format()")
--       print("Format on save disabled")
--     end
--   end
-- end

-- local toggle_format = function()
--   lvim.format_on_save = not lvim.format_on_save
-- -- vim.cmd("au BufWritePre * :silent! lua vim.lsp.buf.format()")
--   print("lvim.format_on_save = " .. tostring(lvim.format_on_save))
-- end

-- lvim.builtin.which_key.mappings["F"] = { toggle_format_on_save, "Toggle Format" }


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
lvim.builtin.which_key.mappings["p"] = { "\"_dP", "Paste again" }
lvim.keys.visual_mode["<leader>p"] = "\"_dP"
-- lvim.keys.normal_mode["<leader>p"] = "\"_dP"
-- lvim.keys.visual_mode["<leader>p"] = "\"_dP"


-- Copying to/from System Clipboard
lvim.builtin.which_key.mappings["y"] = { '"+y', "Copy to clipboard" }
lvim.builtin.which_key.mappings["Y"] = { '"+Y', "Copy line to clipboard" }
lvim.keys.visual_mode["<leader>y"] = '"+y'

-- Move between buffers
-- lvim.keys.normal_mode["H"] = { ":bprevious<cr>", "Previous Buffer" }
-- lvim.keys.normal_mode["L"] = { ":bnext<cr>", "Next Buffer" }
lvim.keys.normal_mode["H"] = ":bprevious<cr>"
lvim.keys.normal_mode["L"] = ":bnext<cr>"

-- Delete all buffer except the current one
lvim.builtin.which_key.mappings["C"] = { ":%bd|e#|bd#<CR>", "Close all buffers" }

-- Make current file executable
lvim.builtin.which_key.mappings["x"] = { ":!chmod +x %<cr>", "Make executable" }

-- Telescope
lvim.builtin.which_key.mappings["f"] = { ":Telescope find_files<cr>", "Find File" }
lvim.builtin.which_key.mappings["b"] = { ":Telescope buffers<cr>", "Find Buffers" }
lvim.builtin.which_key.mappings["/"] = { ":Telescope live_grep<cr>", "Find Text" }
lvim.builtin.which_key.mappings["h"] = { ":Telescope help_tags<cr>", "Find Help" }
lvim.builtin.which_key.mappings["o"] = { ":lua require'telescope'.extensions.project.project{}<cr>", "Find Projects" }

-- Harpoon
lvim.builtin.which_key.mappings["i"] = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon" }
lvim.builtin.which_key.mappings["a"] = { ":lua require('harpoon.mark').add_file()<cr>", "Harpoon Add" }
-- lvim.builtin.which_key.mappings["n"] = { ":lua require('harpoon.ui').nav_next()<cr>", "Harpoon Next" }
-- lvim.builtin.which_key.mappings["p"] = { ":lua require('harpoon.ui').nav_prev()<cr>", "Harpoon Prev" }
-- lvim.builtin.which_key.mappings["t"] = { ":lua require('harpoon.tmux').gotoTerminal('{down-of}')<cr>",  "Harpoon Terminal" }


-- Neogit
lvim.builtin.which_key.mappings["gn"] = { ":Neogit<cr>", "Neogit" }
