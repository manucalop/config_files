-- local colorscheme = "lunar"
local colorscheme = "gruvbox-material"

-- :h gruvbox-material for more options
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_foreground = "original"
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
lvim.colorscheme = colorscheme
lvim.builtin.lualine.options.theme = colorscheme

-- Hide bufferline
-- lvim.builtin.bufferline.active = false
-- lvim.builtin.dap.active = true
-- vim.opt.showtabline = 0

-- Manual Root Project (Not git based)
lvim.builtin.project.manual_mode = true

-- Python provider
--

local brew_dir = vim.fn.system("brew --prefix"):gsub("\n", "")

vim.g.python3_host_prog = brew_dir .. '/bin/python3'
vim.g.python3_host_prog_pip = brew_dir .. '/bin/pip3'

vim.opt.linebreak = true
-- vim.opt.wrap = true
-- vim.opt.tabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.softtabstop = 0
-- vim.opt.expandtab = true
-- vim.opt.smarttab = true
-- vim.opt.foldlevelstart = 0
-- vim.opt.foldenable = true
vim.opt.foldnestmax = 2
vim.opt.clipboard = "unnamedplus"

-- vim.opt.foldmethod = "marker"
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
-- lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
-- Disable window picker
lvim.builtin.nvimtree.setup.actions.open_file.window_picker.enable = false
lvim.builtin.nvimtree.setup.view.width = 50
-- lvim.builtin.nvimtree.show_icons.git = 0

-- lvim.builtin.treesitter.ensure_installed = "all"
-- lvim.builtin.treesitter.ignore_install = { "phpdoc" }

lvim.builtin.treesitter.highlight.enabled = true


-- Let nvim-tree preserve window proportions
-- lvim.builtin.nvimtree.setup.actions.open_file.resize_window = true
