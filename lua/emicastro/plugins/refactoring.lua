return {
  "ThePrimeagen/refactoring.nvim",
  lazy = true,
  cmd = { "Refactor" },
  enabled = false,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  config = function()
    require("refactoring").setup({})
  end,
}
