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

--[[local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = Emicastro_golang,
    pattern = "*.go",
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        -- alternate between file and file_test
        vim.keymap.set("n", "<leader>gg", function()
            vim.cmd  GoAlt 
        end, opts)

        vim.keymap.set("n", "<leader>gie", function()
            vim.cmd [[ GoIfErr ]
        end, opts)

        vim.keymap.set("n", "<leader>gfs", function()
            vim.cmd [[ GoFillStruct ]
        end, opts)

    end,
})
]]
