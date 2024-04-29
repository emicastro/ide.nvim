return {
  "rest-nvim/rest.nvim",
  ft = "http",
  cmd = "Rest",
  dependencies = {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  config = function()
    require("telescope").load_extension("rest")
    require("rest-nvim").setup({
      keybinds = {
        {
          "<localleader>rr",
          "<cmd>Rest run<cr>",
          "Run request under the cursor",
        },
        {
          "<localleader>rl",
          "<cmd>Rest run last<cr>",
          "Re-run latest request",
        },
        {
          "<leader>re",
          "<cmd>Telescope rest select_env<cr>",
          "Select environment",
        },
      },
    })
  end,
}
