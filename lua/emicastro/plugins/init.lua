-- [[ Sets up lazy with plugins ]]
require('lazy').setup({
  'nvim-lua/plenary.nvim',

  'eandrju/cellular-automaton.nvim',

  'nvim-treesitter/playground',

  -- Git stuff
  'mbbill/undotree',

  'kyazdani42/nvim-web-devicons',


  -- Distraction-free coding for Neovim
  -- Toggle Zen Mode with `:ZenMode`
  -- opens the current buffer in a new full-screen floating window
  'folke/zen-mode.nvim',

  'tpope/vim-sleuth',   -- Detect tabstop and shiftwidth automatically


  -- Use at your own risk
  --  'github/copilot.nvim',

  'nvim-neotest/nvim-nio',

  -- The joy of vim motions by theprimeagen
  'theprimeagen/vim-be-good',

}, {})
