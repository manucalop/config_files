return {
  { "ellisonleao/gruvbox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-w>h", "<cmd>TmuxNavigateLeft<cr>" },
      { "<c-w>j", "<cmd>TmuxNavigateDown<cr>" },
      { "<c-w>k", "<cmd>TmuxNavigateUp<cr>" },
      { "<c-w>l", "<cmd>TmuxNavigateRight<cr>" },
    },
  },
  {
    "williamboman/mason.nvim",

    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        -- "flake8",
        -- "black",
        -- "isort",
      },
    },
  },
  {
    "conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        -- Run multiple formatters sequentially
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        go = { "goimports", "gofmt" },
        -- Run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {},
        pyright = {
          handlers = {
            -- Disable pyright diagnostics in favor of ruff
            ["textDocument/publishDiagnostics"] = function() end,
          },
        },
      },
    },
  },
}