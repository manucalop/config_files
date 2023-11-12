local linters = require "lvim.lsp.null-ls.linters"

local function get_git_root_dir()
  local git_dir = vim.fn.system("git rev-parse --show-toplevel")
  return git_dir:gsub("%s+", "")
end

local flake8_ignore_list = {
  "Q000",
  "E203",
  "W503",
}

linters.setup {
  { name = "flake8",
    extra_args = {
      -- "--config=" .. get_git_root_dir() .. "/setup.cfg",
      "--ignore=" .. table.concat(flake8_ignore_list, ","),
      -- "--max-line-length=120",
      --   "--extend-ignore=" .. table.concat(flake8_ignore_list, ","),
    },
  }
}
