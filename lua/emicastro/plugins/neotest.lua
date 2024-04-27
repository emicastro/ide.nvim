return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  optional = true,
  opts = function(_, opts)
    opts.adapters = opts.adapters or {}
    vim.list_extend(opts.adapters, {
      require("rustaceanvim.neotest"),
    })
  end,
}
