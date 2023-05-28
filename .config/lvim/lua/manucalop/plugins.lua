lvim.plugins = {
  { "gruvbox-community/gruvbox" }, -- Gruvbox Colorscheme
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "github/copilot.vim" },
  { "folke/trouble.nvim",             cmd = "TroubleToggle" }, -- Showing diagnostics
  { "ThePrimeagen/harpoon" },
  { "norcalli/nvim-colorizer.lua" },
  { "alexghergh/nvim-tmux-navigation" },
  { "romgrk/nvim-treesitter-context" },
  { "sbdchd/neoformat" },
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup()
    end
  },
  -- Testing
  -- { "nvim-treesitter/playground" },
  -- { "ThePrimeagen/git-worktree.nvim" },
  -- { "theHamsta/nvim-dap-virtual-text" },
  -- { "TimUntersberger/neogit" },
  -- { "ThePrimeagen/vim-be-good" },
  -- { "rcarriga/nvim-notify" },
  -- { "nvim-telescope/telescope-file-browser.nvim" },
  -- { "nvim-telescope/telescope-project.nvim" },
  -----------------------------------------------
  -- { 'ttibsi/pre-commit.nvim' },
  -- { 'pwntester/octo.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-telescope/telescope.nvim',
  --     'kyazdani42/nvim-web-devicons',
  --   },
  --   config = function()
  --     require "octo".setup()
  --   end
  -- },
  -- { 'tell-k/vim-autopep8' },
}
