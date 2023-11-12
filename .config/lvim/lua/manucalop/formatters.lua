lvim.format_on_save.enabled = true
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  { name = "isort" }
}
