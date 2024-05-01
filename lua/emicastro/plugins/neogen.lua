-- better code annotation
return {
  "danymat/neogen",
  lazy = true,
  cmd = { "Neogen" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    local neogen = require("neogen")

    neogen.setup({
      snippet_engine = "luasnip",
    })
  end,
  -- version = "*"
}
