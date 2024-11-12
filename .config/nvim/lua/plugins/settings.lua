if true then
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
          "flake8",
          "black",
          "isort",
        },
      },
    },
    {
      "conform.nvim",
      opts = {
        formatters_by_ft = {
          lua = { "stylua" },
          -- Run multiple formatters sequentially
          python = { "isort", "black" },
          -- python = { "isort", "ruff-lsp" },
          go = { "goimports", "gofmt" },
          -- Run only the first available formatter
          javascript = { { "prettierd", "prettier" } },
        },
      },
    },
    { import = "lazyvim.plugins.extras.ai.copilot" },
    { import = "lazyvim.plugins.extras.coding.yanky" },
    { import = "lazyvim.plugins.extras.coding.mini-surround" },
    { import = "lazyvim.plugins.extras.dap.core" },
    { import = "lazyvim.plugins.extras.editor.harpoon2" },
    { import = "lazyvim.plugins.extras.formatting.black" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.lang.sql" },
    { import = "lazyvim.plugins.extras.lang.docker" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.lang.tex" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.test.core" },
    { import = "lazyvim.plugins.extras.ui.treesitter-context" },
  }
end
