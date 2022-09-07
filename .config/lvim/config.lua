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
}

-- hide bufferline
lvim.builtin.bufferline.active = false
lvim.builtin.dap.active = true
vim.opt.showtabline = 0

-- Copilot{{{
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

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

-- Key mappings {{{

-- Save with C-s
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

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

-- Create empty lines above and below
lvim.keys.normal_mode["<s-j>"] = "o<ESC>k"
lvim.keys.normal_mode["<s-k>"] = "o<ESC>j"

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
-- lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.treesitter.ensure_installed = "all"
lvim.builtin.treesitter.ignore_install = { "phpdoc" }

lvim.builtin.treesitter.highlight.enabled = true
-- }}}

-- Autocommands{{{

vim.cmd("au BufEnter *.py setlocal foldmethod=indent")
vim.cmd("au BufEnter *.lua setlocal foldmethod=marker")
vim.cmd("au BufEnter *.bash_aliases setlocal foldmethod=marker")
vim.cmd("au BufWritePre * :silent! Neoformat")


--}}}

-- Formatters {{{
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--     {
--         command = "black",
--         filetypes = { "python" },
--         extra_args = { "-l 100" },
--     },
--     {
--         command = "isort",
--         filetypes = { "python" },
--         extra_args = { "-l 100" },
--     },
--     -- {
--     --   command = "prettier",
--     --   extra_args = { "--print-with", "100" },
--     --   filetypes = { "typescript", "typescriptreact" },
--     -- },
-- }
--}}}

-- Linters {{{
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    {
        command = "flake8",
        filetypes = { "python" },
        extra_args = { "--max-line-length=10000" },
    },
    {
        command = "shellcheck",
        extra_args = { "--severity", "warning" },
    },
    {
        command = "codespell",
        filetypes = { "javascript", "python" },
        -- extra_args = { "--print-with=100", "--line-width=100" },
    },
}
--}}}
