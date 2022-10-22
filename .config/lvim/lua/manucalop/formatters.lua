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
  {
    command = "prettier",
    extra_args = { "--print-with", "100" },
    filetypes = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "json",
      "yaml",
      "markdown",
      "html",
      "css",
      "scss",
      "less",
      "graphql",
      "vue",
      "angular",
    },
  },
}
