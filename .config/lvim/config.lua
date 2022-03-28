-- manucalop's lvim config file

-- Plugins{{{
lvim.plugins = {
    {"folke/tokyonight.nvim"},
    {"github/copilot.vim"},
    {"folke/trouble.nvim", cmd = "TroubleToggle"},
}
--}}}

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
local cmp = require "cmp"

lvim.builtin.cmp.mapping["<Tab>"] = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  else
    local copilot_keys = vim.fn["copilot#Accept"]()
    if copilot_keys ~= "" then
      vim.api.nvim_feedkeys(copilot_keys, "i", true)
    else
      fallback()
    end
  end
end

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


--}}}

-- Options {{{

vim.opt.wrap = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.foldlevelstart= 0
vim.opt.foldenable = true

vim.opt.foldmethod = "marker"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.backup = false
vim.opt.swapfile = false

-- lvim stuff
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
lvim.leader = "space"

lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "cpp",
    "go",
    "python",
    "markdown",
    "yaml",
    "json",
    "html",
    "css",
    "lua",
    "javascript",
    "rust",
    "java",
    "hcl",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
-- }}}

-- Autocommands{{{
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.py", "setlocal foldmethod=indent" },
  { "BufWinEnter", "*.lua", "setlocal foldmethod=marker" },
  { "BufWinEnter", "*.bash_aliases", "setlocal foldmethod=marker" },
}
--}}}

-- Formatters {{{
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
--}}}

-- Linters {{{
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
        command = "flake8",
        filetypes = { "python" },
        -- extra_args = { "--print-with=100", "--line-width=100" },
  },
  {
        command = "shellcheck",
        extra_args = { "--severity", "warning"},
  },
  {
        command = "codespell",
        filetypes = { "javascript", "python" },
        -- extra_args = { "--print-with=100", "--line-width=100" },
  },
}
--}}}

