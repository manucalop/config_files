local linters = require "lvim.lsp.null-ls.linters"
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#diagnostics

local function get_git_root_dir()
  local git_dir = vim.fn.system("git rev-parse --show-toplevel")
  return git_dir:gsub("%s+", "")
end

local flake8_ignore_list = {
  "Q000",
  "E203",
  "W503",
}


-- Allow spanish and english
-- require("lvim.lsp.manager").setup("ltex", {
--   settings = {
--     language = "en-US,es-ES",
--   },
-- })


-- require("lvim.lsp.manager").setup("marksman")

-- require 'lspconfig'.marksman.setup {}

linters.setup {
  { name = "flake8",
    extra_args = {
      -- "--config=" .. get_git_root_dir() .. "/setup.cfg",
      "--ignore=" .. table.concat(flake8_ignore_list, ","),
      -- "--max-line-length=120",
      --   "--extend-ignore=" .. table.concat(flake8_ignore_list, ","),
    },
  },
}
