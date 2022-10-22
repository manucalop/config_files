-- manucalop's lvim config file

-- Plugins{{{
lvim.plugins = {
    -- Colorscheme
    { "gruvbox-community/gruvbox" }, -- Gruvbox Colorscheme
    { "tpope/vim-repeat" },
    { "tpope/vim-surround" },
    { "github/copilot.vim" },
    { "alexghergh/nvim-tmux-navigation" },
    { "folke/trouble.nvim", cmd = "TroubleToggle" }, -- Showing diagnostics
    -- Testing
    { "romgrk/nvim-treesitter-context" },
    { "nvim-treesitter/playground" },
    { "rcarriga/nvim-dap-ui" },
    { "theHamsta/nvim-dap-virtual-text" },
    { "ThePrimeagen/git-worktree.nvim" },
    { "ThePrimeagen/harpoon" },
    { "TimUntersberger/neogit" },
    { "sbdchd/neoformat" },
    { "norcalli/nvim-colorizer.lua" },
    { "ThePrimeagen/vim-be-good" },
}
require 'colorizer'.setup()
-- Hide bufferline
-- lvim.builtin.bufferline.active = false
lvim.builtin.dap.active = true
vim.opt.showtabline = 0

-- Manual Project Management (Not git based)
lvim.builtin.project.manual_mode = true


-- Python provider
vim.g.python3_host_prog = '/opt/homebrew/bin/python3'

-- Copilot{{{
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
vim.g.copilot_node_command = "~/.asdf/installs/nodejs/17.9.1/bin/node"

lvim.builtin.cmp.mapping["<Tab>"] = function(fallback)
    local copilot_keys = vim.fn["copilot#Accept"]()
    if copilot_keys ~= "" then
        vim.api.nvim_feedkeys(copilot_keys, "i", true)
    else
        fallback()
    end
end
--}}}

-- Tmux Navigator{{{
require 'nvim-tmux-navigation'.setup {
    disable_when_zoomed = true, -- defaults to false
    keybindings = {
        left = "<C-w>h",
        down = "<C-w>j",
        up = "<C-w>k",
        right = "<C-w>l",
        -- last_active = "<C-\\>",
        -- next = "<C-Space>",
    }
}
--}}}

-- Telescope{{{
-- Ignore folder patterns node_modules
lvim.builtin.telescope.defaults.file_ignore_patterns = { "node_modules", ".venv" }
--}}}

--}}}

-- Options {{{
-- local colorscheme = "onedarker"
local colorscheme = "gruvbox"
lvim.colorscheme = colorscheme
lvim.builtin.lualine.options.theme = colorscheme

-- vim.opt.wrap = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.foldlevelstart = 0
vim.opt.foldenable = true
vim.opt.clipboard = "unnamedplus"

vim.opt.foldmethod = "marker"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.backup = false
vim.opt.swapfile = false

-- lvim stuff
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.leader = "space"

-- lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
lvim.builtin.nvimtree.setup.view.width = 50
-- lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.treesitter.ensure_installed = "all"
lvim.builtin.treesitter.ignore_install = { "phpdoc" }

lvim.builtin.treesitter.highlight.enabled = true

-- Let nvim-tree preserve window proportions
lvim.builtin.nvimtree.setup.actions.open_file.resize_window = true
-- }}}

-- Key mappings {{{

-- Saving
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- Closing
lvim.keys.normal_mode["<C-c>"] = ":q<cr>"
-- Finding
lvim.keys.normal_mode["<C-f>"] = ":Telescope find_files<cr>"

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
lvim.keys.normal_mode["<leader>p"] = "\"_dP"
lvim.keys.visual_mode["<leader>p"] = "\"_dP"

-- Copying to/from System Clipboard
lvim.keys.normal_mode["<leader>y"] = '"+y'
lvim.keys.visual_mode["<leader>y"] = '"+y'
lvim.keys.normal_mode["<leader>Y"] = '"+Y'

-- Move between buffers
lvim.keys.normal_mode["H"] = ":bprevious<CR>"
lvim.keys.normal_mode["L"] = ":bnext<CR>"


-- Delete all buffer except the current one
lvim.keys.normal_mode["<leader>C"] = ":%bd|e#|bd#<CR>"


-- Make current file executable
lvim.keys.normal_mode["<leader>x"] = ":!chmod +x %<cr>"

-- Telescope
lvim.builtin.which_key.mappings["/"] = { "<cmd>Telescope live_grep<cr>", "Search" }

-- Harpoon
lvim.keys.normal_mode["<leader>i"] = ":lua require('harpoon.ui').toggle_quick_menu()<cr>"
lvim.keys.normal_mode["<leader>a"] = ":lua require('harpoon.mark').add_file()<cr>"
lvim.keys.normal_mode["<leader>hi"] = ":lua require('harpoon.ui').toggle_quick_menu()<cr>"
lvim.keys.normal_mode["<leader>ha"] = ":lua require('harpoon.mark').add_file()<cr>"
lvim.keys.normal_mode["<leader>hn"] = ":lua require('harpoon.ui').nav_next()<cr>"
lvim.keys.normal_mode["<leader>hp"] = ":lua require('harpoon.ui').nav_next()<cr>"
lvim.keys.normal_mode["<leader>ht"] = ":lua require('harpoon.tmux').gotoTerminal('{down-of}')<cr>"

-- Neogit
lvim.keys.normal_mode["<leader>gn"] = ":Neogit<cr>"

--}}}

-- Autocommands{{{

vim.cmd("au BufEnter *.py setlocal foldmethod=indent")
vim.cmd("au BufEnter *.lua setlocal foldmethod=marker")
vim.cmd("au BufEnter *.bash_aliases setlocal foldmethod=marker")
-- vim.cmd("au BufWritePre * :silent! Neoformat")



--}}}

-- Formatters {{{
-- Setup Python neoformat to apply both black and isort

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    {
        command = "black",
        filetypes = { "python" },
        extra_args = { "-l 100" },
    },
    {
        command = "isort",
        filetypes = { "python" },
        extra_args = { "-l 100" },
    },
    -- {
    --   command = "prettier",
    --   extra_args = { "--print-with", "100" },
    --   filetypes = { "typescript", "typescriptreact" },
    -- },
}
-- }}}

-- Linters {{{
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
-- {
--     command = "flake8",
--     filetypes = { "python" },
--     extra_args = { "--max-line-length=10000" },
-- },
-- {
--     command = "shellcheck",
--     extra_args = { "--severity", "warning" },
-- },
-- {
--     command = "codespell",
--     filetypes = { "javascript", "python" },
--     -- extra_args = { "--print-with=100", "--line-width=100" },
-- },
-- }
--}}}
