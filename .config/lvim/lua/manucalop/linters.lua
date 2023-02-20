local linters = require "lvim.lsp.null-ls.linters"

local function get_git_root_dir()
  local git_dir = vim.fn.system("git rev-parse --show-toplevel")
  return git_dir:gsub("%s+", "")
end

local flake8_ignore_list = {
  -- "D",
  -- "N400",
  -- "N805",
  -- "PD005",
  -- "PD010",
  -- "W503",
  -- "WPS110",
  -- "WPS115",
  -- "WPS204",
  -- "WPS220",
  -- "WPS221",
  -- "WPS226",
  -- "WPS300",
  -- "WPS305",
  -- "WPS306",
  -- "WPS323",
  -- "WPS237",
  -- "WPS336",
  -- "WPS410",
  -- "WPS412",
  -- "WPS428",
  -- "WPS431",
  -- "WPS465",
  -- "WPS503",
  -- "WPS115",
  -- "WPS602",
  -- "N815",
  -- "S101",
  -- "S310",
  "Q000",
}


linters.setup {
  {
    command = "flake8",
    filetypes = { "python" },
    extra_args = {
      "--config=" .. get_git_root_dir() .. "/setup.cfg",
      -- "--ignore=" .. table.concat(flake8_ignore_list, ","),
      "--extend-ignore=" .. table.concat(flake8_ignore_list, ","),
    },
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
