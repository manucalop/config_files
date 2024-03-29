return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")
  use("TimUntersberger/neogit")
  use("lewis6991/gitsigns.nvim")
  use("folke/lua-dev.nvim")
  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate"
  })
  use("folke/which-key.nvim")
  use("akinsho/bufferline.nvim")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-path")
  use("saadparwaiz1/cmp_luasnip")
  use("hrsh7th/cmp-buffer")
  use("kyazdani42/nvim-tree.lua")
  use("numToStr/Comment.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("b0o/schemastore.nvim")
  use("windwp/nvim-autopairs")
  use("goolord/alpha-nvim")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("ahmedkhalf/project.nvim")
  use("L3MON4D3/LuaSnip")
  use("antoinemadec/FixCursorHold.nvim")
  use("lunarvim/onedarker.nvim")
  use("nvim-lua/popup.nvim")
  use("Tastyep/structlog.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use("williamboman/nvim-lsp-installer")
  use("neovim/nvim-lspconfig")
  use("rafamadriz/friendly-snippets")
  use("tamago324/nlsp-settings.nvim")
  use("nvim-telescope/telescope-fzf-native.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("rcarriga/nvim-notify")
  use("akinsho/toggleterm.nvim")
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  })

end)
