vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<leader>u", ":UndotreeShow<CR>")
-- keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle)

-- Fast saving
keymap.set("n", "<Leader>w", ":write!<CR>", opts)
keymap.set("n", "<Leader>qq", ":q!<CR>", opts)

-- Code Folding
keymap.set("n", "-", "<cmd>foldclose<CR>", { desc = "Close code fold" })
keymap.set("n", "+", "<cmd>foldopen<CR>", { desc = "Open code fold" })

-- In visual mode, moves the selected line up (J) or down (K)
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z") -- removes the '\n' from the current line

-- PgUp and PgDn
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Move the cursor to the next search match and bring the cursor line
-- to the middle of the screen
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("n", "<leader>vwm", function()
  require("vim-with-me").StartVimWithMe()
end)
keymap.set("n", "<leader>svwm", function()
  require("vim-with-me").StopVimWithMe()
end)

-- paste over currently selected text without yanking it
-- p puts text after the cursor,
-- P puts text before the cursor.
keymap.set("v", "p", '"_dp')
keymap.set("v", "P", '"_dP')

-- copy everything between { and } including the brackets
keymap.set("n", "YY", "va{Vy", opts)

-- in visual-block, delete selection and paste buffered text, DROPPING the replaced text!
-- 'pasted' text is still buffered!!!
keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- Yanks selection to the clipboard.
keymap.set("n", "<leader>Y", [["+Y]]) -- Yanks the entire line to the clipboard!

keymap.set({ "n", "v" }, "<leader>D", [["_d]]) -- Drops the selection without buffering it

-- This is going to get me cancelled
keymap.set("i", "<C-c>", "<Esc>")

keymap.set("n", "Q", "<nop>")
-- keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Move to start/end of line
keymap.set({ "n", "x", "o" }, "H", "^", opts)
keymap.set({ "n", "x", "o" }, "L", "g_", opts)

-- Navigate buffers
keymap.set("n", "<Right>", ":bnext<CR>", opts)
keymap.set("n", "<Left>", ":bprevious<CR>", opts)

-- replace string globally
keymap.set("n", "<leader>rs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Split line with X
keymap.set("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", { silent = true })

-- Select all
keymap.set("n", "<C-a>", "ggVG", opts)

-- write file in current directory
-- :w %:h/<new-file-name>
keymap.set("n", "<C-n>", ":w %:h/", opts)

-- Diagnostic keymaps
keymap.set("n", "[d", vim.diagnostic.goto_next)
keymap.set("n", "]d", vim.diagnostic.goto_prev)
keymap.set("n", "<leader>e", vim.diagnostic.open_float)
keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Open new terminal window (tv for vertical - ht for horizontal)
keymap.set("n", "<leader>vt", ":botright vnew <Bar> :terminal<CR>")
keymap.set("n", "<leader>ht", ":botright new <Bar> :terminal<CR>")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Escape Terminal mode with <leader><ESC>
vim.api.nvim_set_keymap("t", "<ESC><ESC>", "<C-\\><C-n>", { desc = "Exit terminal mode", noremap = true })

keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")
keymap.set("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>")
