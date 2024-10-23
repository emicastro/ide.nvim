local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWinEnter", {
  group = Emicastro_golang,
  pattern = "*.go",
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    -- alternate between file and file_test
    vim.keymap.set("n", "<leader>gg", function()
      vim.cmd([[ GoAlt ]])
    end, { buffer = bufnr, remap = false, desc = "alternate between file and file_test" })

    vim.keymap.set("n", "<leader>gie", function()
      vim.cmd([[ GoIfErr ]])
    end, { buffer = bufnr, remap = false, desc = "generate if error block" })

    vim.keymap.set("n", "<leader>gfs", function()
      vim.cmd([[ GoFillStruct ]])
    end, { buffer = bufnr, remap = false, desc = "fill struct" })
  end,
})

return {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup()
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
