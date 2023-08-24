local linters = require "lvim.lsp.null-ls.linters"

local function get_git_root_dir()
  local git_dir = vim.fn.system("git rev-parse --show-toplevel")
  return git_dir:gsub("%s+", "")
end

local flake8_ignore_list = {
  "Q000",
}

require'lspconfig'.pyright.setup{}

linters.setup {
  {
    command = "flake8",
    filetypes = { "python" },
    -- extra_args = {
    --   "--config=" .. get_git_root_dir() .. "/setup.cfg",
    -- "--ignore=" .. table.concat(flake8_ignore_list, ","),
    -- "--max-line-length=120",
    --   "--extend-ignore=" .. table.concat(flake8_ignore_list, ","),
    -- },
  },
  {
    command = "shellcheck",
    extra_args = { "--severity", "warning" },
  },
  -- {
  --     command = "codespell",
  --     filetypes = { "javascript", "python" },
  --     -- extra_args = { "--print-with=100", "--line-width=100" },
  -- },
}
