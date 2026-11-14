lvim.format_on_save.enabled = true
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#formatting
local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup {
  { name = "black" },
  { name = "isort" },
  { name = "markdownlint" },
  { name = "markdown_toc" },
  { name = "beautysh" },
}
