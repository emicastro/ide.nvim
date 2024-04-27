return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-go",
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  optional = true,
  opts = {
    ["rustaceanvim.neotest"] = {},
    ["neotest-go"] = {
      -- Here we can set options for neotest-go, e.g.
      -- args = { "-tags=integration" }
      recursive_run = true,
    },
  },
}
