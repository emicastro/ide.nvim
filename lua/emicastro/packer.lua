-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use 'kyazdani42/nvim-web-devicons'
  use {
      'nvim-lualine/lualine.nvim', -- Fancier statusline
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  -- Snippet Collection (Optional)
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use('numToStr/Comment.nvim') -- 'gc' to comment visual regions/lines

  use('folke/zen-mode.nvim')
  use('eandrju/cellular-automaton.nvim')
  -- use('github/copilot.nvim')
  use('lukas-reineke/indent-blankline.nvim')
  use('lewis6991/gitsigns.nvim')

  use('theprimeagen/vim-be-good')

  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use('tpope/vim-surround') --provides mappings to easily delete, change and add such surroundings in pairs

  -- Golang
  use('ray-x/go.nvim')
  use{'ray-x/guihua.lua', run = 'cd lua/fzy && make'} -- recommanded if need floating window support

  -- Debugger
  use('mfussenegger/nvim-dap')
  use('rcarriga/nvim-dap-ui')
  use('leoluz/nvim-dap-go')
  use('theHamsta/nvim-dap-virtual-text')
  -- use('nvim-telescope/telescope-dap.nvim')


end)
