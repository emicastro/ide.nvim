-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup {
    view = {
        number = true,
        relativenumber = true
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
}

vim.keymap.set("n", "<leader>d", ":NvimTreeFindFileToggle<CR>")
