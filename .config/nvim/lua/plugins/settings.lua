-- vim.lsp.enable("ty")
-- vim.lsp.enable("pyrefly")
return {
  { "ellisonleao/gruvbox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-w>h", "<cmd>TmuxNavigateLeft<cr>" },
      { "<c-w>j", "<cmd>TmuxNavigateDown<cr>" },
      { "<c-w>k", "<cmd>TmuxNavigateUp<cr>" },
      { "<c-w>l", "<cmd>TmuxNavigateRight<cr>" },
    },
  },
  {
    "mason-org/mason.nvim",

    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        -- "flake8",
        -- "black",
        -- "isort",
      },
    },
  },
  {
    "conform.nvim",
    opts = {
      default_format_opts = {
        timeout_ms = 10000,
      },
      formatters = {
        sqlfluff = {
          command = "sqlfluff",
          args = { "fix", "--FIX-EVEN-UNPARSABLE", "-" },
        },
        djlint = {
          command = "djlint",
          args = { "--profile", "jinja", "--reformat", "-", "--max-line-length", "88" },
        },
        shfmt = {
          command = "shfmt",
          args = { "-i", "4", "-ci" },
        },
      },
      formatters_by_ft = {
        sql = { "sqlfluff" },
        -- sql = { "sqruff" },
        -- sql = { "sqruff", "sqlfluff" },
        -- html = { "djlint" },
        bash = { "shfmt" },
        lua = { "stylua" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        go = { "goimports", "gofmt" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
  -- {
  --   "mfussenegger/nvim-lint",
  --   opts = {
  --     linters_by_ft = {
  --       sql = { "sqlfluff" },
  --     },
  --   },
  -- },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       ty = {},
  --     },
  --   },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       pyright = {
  --         mason = false,
  --         python = {
  --           analysis = {
  --             typeCheckingMode = "off",
  --           },
  --         },
  --       },
  --       ty = {
  --         settings = {
  --           ty = {
  --             inlayHints = {
  --               variableTypes = false,
  --             },
  --             disableLanguageServices = true,
  --             diagnosticMode = "workspace",
  --             experimental = {
  --               rename = true,
  --             },
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },
  -- LSP keymaps
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function()
  --     local keys = require("lazyvim.plugins.lsp.keymaps").get()
  --     keys[#keys + 1] = { "K", false }
  --   end,
  -- },
  {
    "stevearc/aerial.nvim",
    opts = {
      layout = {
        min_width = 0.3,
      },
      close_on_select = true,
    },
  },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>-",
        "<cmd>Yazi cwd<cr>",
        desc = "Open yazi at the current file",
      },
    },
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
    },
  },
  -- {
  --   "kristijanhusak/vim-dadbod-ui",
  --   keys = {
  --     { "<leader>A", "<Plug>(DBUI_ExecuteQuery)", desc = "Execute Query" },
  --   },
  -- },
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>.", false },
      { "<leader>S", false },
      { "<leader>dps", false },
    },
  },
  {
    "nvim-mini/mini.surround",
    opts = {
      mappings = {
        add = "gsa", -- Add surrounding in Normal and Visual modes
        delete = "gsd", -- Delete surrounding
        find = "gsf", -- Find surrounding (to the right)
        find_left = "gsF", -- Find surrounding (to the left)
        highlight = "gsh", -- Highlight surrounding
        replace = "gsr", -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
      },
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        -- Insert completion item on selection, don't select by default
        list = {
          selection = {
            auto_insert = false,
          },
        },
      },
      keymap = {
        -- preset = "enter",
        preset = "super-tab",
        -- ["<Tab>"] = { "select_and_accept" },
      },
    },
  },
}
