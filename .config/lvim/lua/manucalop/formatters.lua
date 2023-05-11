local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "black",
    filetypes = { "python" },
    extra_args = {
      --"-S",
      "-l 79",
    },
  },
  {
    command = "isort",
    filetypes = { "python" },
    -- extra_args = { "-l 120" },
  },
  {
    command = "prettier",
    extra_args = {
      "--single-quote",
      "--print-width 150",
    },
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
