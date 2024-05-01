vim.cmd("let g:netrw_liststyle = 3")

-- Change to false if working in a system without a NF installed.
vim.g.have_nerd_font = true

local opt = vim.opt

-- [[ Setting options ]]
-- See `:help vim.opt`

opt.guicursor = ""

opt.nu = true
opt.relativenumber = true

-- -- folds
-- opt.foldenable = true
-- opt.foldlevelstart = 99

-- tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.wrap = false

-- filesformats
opt.fileformats = "unix,mac,dos"
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- search settings
opt.ignorecase = true
opt.smartcase = true -- if you include mixed case in your search it assumes you want-case sensitive
opt.hlsearch = false
opt.incsearch = true

-- ui settings
-- opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "80"

-- backspace
opt.backspace = "indent,eol,start"

-- split windows
opt.splitright = true
opt.splitbelow = true
