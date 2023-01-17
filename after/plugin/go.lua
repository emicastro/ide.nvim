require('go').setup()
require('dap-go').setup()

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
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
            vim.cmd [[ GoAlt ]]
        end, opts)

    end,
})
