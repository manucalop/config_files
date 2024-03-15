-- Saving
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- Closing
function close_buffer_or_window()
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })
  local windows = vim.fn.getwininfo()
  if #windows > 1 then
    vim.cmd("close")
  else
    if #buffers == 1 then
      vim.cmd("quit")
    else
      vim.cmd("bdelete")
    end
  end
end

lvim.keys.normal_mode["<C-c>"] = ":lua close_buffer_or_window()<cr>"


-- Cursor movement
-- Move around wrapped lines
lvim.keys.normal_mode["j"] = "gj"
lvim.keys.normal_mode["k"] = "gk"
lvim.keys.visual_mode["j"] = "gj"
lvim.keys.visual_mode["k"] = "gk"

-- Fast cursor movement
-- lvim.keys.normal_mode["<c-j>"] = "5j"
-- lvim.keys.normal_mode["<c-k>"] = "5k"
-- lvim.keys.visual_mode["<c-j>"] = "5j"
-- lvim.keys.visual_mode["<c-k>"] = "5k"

-- Jump accross methods
-- lvim.keys.normal_mode["gn"] = "]m"
-- lvim.keys.normal_mode["gp"] = "[m"


-- Scroll
lvim.keys.normal_mode["<c-u>"] = "5<c-y>"
lvim.keys.normal_mode["<c-d>"] = "5<c-e>"


-- Create empty lines above and below
lvim.lsp.buffer_mappings.normal_mode["K"]  = nil
lvim.keys.normal_mode["K"]                 = "O<Esc>j"
lvim.keys.normal_mode["J"]                 = "o<Esc>k"

-- Buffer Commands
lvim.keys.normal_mode["<c-n>"]             = ":bnext<cr>"
lvim.keys.normal_mode["<c-p>"]             = ":bprevious<cr>"
-- Use CTRL-O and CTRL-I to navigate through the jump list. :help jump-motions
-- lvim.keys.normal_mode["H"] = ":bprevious<cr>"
-- lvim.keys.normal_mode["L"] = ":bnext<cr>"
-- lvim.keys.normal_mode["L"] = ":bnext<cr>"
lvim.builtin.which_key.mappings["n"]       = { ":bnext<cr>", "Next Buffer" }
lvim.builtin.which_key.mappings["p"]       = { ":bprevious<cr>", "Previous Buffer" }
lvim.builtin.which_key.mappings["t"]       = { ":b#<cr>", "Last Buffer" }

-- Delete all buffer except the current one
lvim.builtin.which_key.mappings["C"]       = { ":%bd|e#|bd#<CR>", "Close all buffers" }

-- Hover
lvim.lsp.buffer_mappings.normal_mode["gh"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show hover" }

-- Keep buffer when pasting
-- lvim.builtin.which_key.mappings["p"] = { "\"_dP", "Paste again" }
lvim.keys.visual_mode["<leader>p"]         = "\"_dP"
-- lvim.keys.normal_mode["<leader>p"] = "\"_dP"
-- lvim.keys.visual_mode["<leader>p"] = "\"_dP"


-- Copying to/from System Clipboard
lvim.builtin.which_key.mappings["y"] = { '"+y', "Copy to clipboard" }
lvim.builtin.which_key.mappings["Y"] = { '"+Y', "Copy line to clipboard" }
lvim.keys.visual_mode["<leader>y"] = '"+y'


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


-- Toggle Format On Save
lvim.builtin.which_key.mappings["F"] = { "<cmd>LvimToggleFormatOnSave<cr>", "Toggle Format On Save" }

-- Create a zoom function with <c-w>_ \| <c-w>\|
function _G.zoom()
  if vim.g.zoomed then
    vim.cmd("wincmd =")
    vim.g.zoomed = false
  else
    vim.cmd("wincmd _")
    vim.cmd("wincmd |")
    vim.g.zoomed = true
  end
end

-- Zoom in and out
lvim.builtin.which_key.mappings["z"] = { ":lua zoom()<cr>", "Zoom" }
