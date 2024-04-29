return {
  -- Distraction-free coding for Neovim
  -- Toggle Zen Mode with `:ZenMode`
  -- opens the current buffer in a new full-screen floating window
  "folke/zen-mode.nvim",

  config = function()
    require("zen-mode").setup({
      window = {
        width = 90,
        options = {
          number = true,
          relativenumber = true,
        },
      },
    })

    vim.keymap.set("n", "<leader>zz", function()
      require("zen-mode").toggle()
      vim.wo.wrap = false
      ColorMyPencils()
    end)
  end,
}
