lvim.plugins = {
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "github/copilot.vim" },
  { "folke/trouble.nvim",  cmd = "TroubleToggle" }, -- Showing diagnostics
  { "ThePrimeagen/harpoon" },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require 'colorizer'.setup()
    end
  },
  { "alexghergh/nvim-tmux-navigation" },
  { "romgrk/nvim-treesitter-context" },
}
