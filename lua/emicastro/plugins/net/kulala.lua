local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWinEnter", {
  group = Emicastro_http,
  pattern = "*.http",
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    -- local opts = { buffer = bufnr, remap = false }
    local kulala = require("kulala")

    -- execute request
    vim.keymap.set("n", "<CR>", function()
      kulala.run()
    end, { buffer = bufnr, remap = false, desc = "Execute the request" })

    vim.keymap.set("n", "<leader>rr", function()
      kulala.replay()
    end, { buffer = bufnr, noremap = true, silent = true, desc = "Replays the last run request" })

    vim.keymap.set("n", "[", function()
      kulala.jump_prev()
    end, { buffer = bufnr, noremap = true, silent = true, desc = "Jump to the previous request" })
    vim.keymap.set("n", "]", function()
      kulala.jump_next()
    end, { buffer = bufnr, noremap = true, silent = true, desc = "Jump to the next request" })
    vim.keymap.set("n", "<leader>i", function()
      kulala.inspect()
    end, { buffer = bufnr, noremap = true, silent = true, desc = "Inspect the current request" })
    vim.keymap.set("n", "<leader>t", function()
      kulala.toggle_view()
    end, { buffer = bufnr, noremap = true, silent = true, desc = "Toggle between body and headers" })
    vim.keymap.set("n", "<leader>co", function()
      kulala.copy()
    end, { buffer = bufnr, noremap = true, silent = true, desc = "Copy the current request as a curl command" })
    vim.keymap.set("n", "<leader>sp", function()
      kulala.scratchpad()
    end, { buffer = bufnr, noremap = true, silent = true, desc = "Opens the scratchpad" })
    vim.keymap.set("n", "<leader>ci", function()
      kulala.from_curl()
    end, { buffer = bufnr, noremap = true, silent = true, desc = "Paste curl from clipboard as http request" })
  end,
})

-- HTTP REST-Client Interface
return {
  "mistweaverco/kulala.nvim",
  opts = {},
}
