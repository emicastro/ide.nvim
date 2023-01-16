-- Here go the configs of DAP
require("nvim-dap-virtual-text").setup()
local dapui = require('dapui')
dapui.setup()

vim.keymap.set("n", "<leader>dq", function ()
    dapui.toggle()
end)
