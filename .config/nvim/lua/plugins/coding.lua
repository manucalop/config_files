return {
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
  {
    "conform.nvim",
    opts = {
      formatters = {
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
}
