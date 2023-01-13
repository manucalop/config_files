local linters = require "lvim.lsp.null-ls.linters"

local function get_git_root_dir()
  local git_dir = vim.fn.system("git rev-parse --show-toplevel")
  return git_dir:gsub("%s+", "")
end

linters.setup {
  {
    command = "flake8",
    filetypes = { "python" },
    extra_args = {
      "--config=" .. get_git_root_dir() .. "/setup.cfg",
    },
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
