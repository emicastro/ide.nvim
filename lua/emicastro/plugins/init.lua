-- [[ Sets up lazy with plugins ]]
return {
  "nvim-lua/plenary.nvim",
  "mbbill/undotree",
  "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

  "eandrju/cellular-automaton.nvim",
  -- The joy of vim motions by theprimeagen
  "theprimeagen/vim-be-good",

  -- Use at your own risk
  --  'github/copilot.nvim',

  -- AST visualizer in neovim
  -- NOTE: This plugin is deactivated since the functionality
  -- is included in Neovim: Use
  -- :Inspect to show the highlight groups under the cursor
  -- :InspectTree to show the parsed syntax tree ("TSPlayground")
  -- :EditQuery to open the Live Query Editor (Nvim 0.10+)
  --
  -- 'nvim-treesitter/playground',
}
