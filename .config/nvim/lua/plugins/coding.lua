return {
  -- Packages
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "pyright",
        "black",
        "isort",
      },
    },
  },
  -- Formatters
  {
    "conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        -- Run multiple formatters sequentially
        python = { "isort", "black" },
        go = { "goimports", "gofmt" },
        -- Run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
      },
    },
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       -- pyright will be automatically installed with mason and loaded with lspconfig
  --       pyright = {},
  --     },
  --   },
  -- },
  -- Linters
  -- {
  --   "nvim-lint",
  --   opts = {
  --     linters_by_ft = {
  --       python = { "flake8", "pyright" },
  --     },
  --   },
  -- },
}
