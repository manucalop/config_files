local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "flake8",
    filetypes = { "python" },
    extra_args = { "--max-line-length=80" },
  },

  -- {
  --     command = "shellcheck",
  --     extra_args = { "--severity", "warning" },
  -- },
  -- {
  --     command = "codespell",
  --     filetypes = { "javascript", "python" },
  --     -- extra_args = { "--print-with=100", "--line-width=100" },
  -- },
}
