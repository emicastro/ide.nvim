require("emicastro.core")
require("emicastro.lazy")

local api = vim.api

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

local augroup = api.nvim_create_augroup
local EmiCastroGroup = augroup("EmiCastro", {})

local autocmd = api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
  require("plenary.reload").reload_module(name)
end

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})

autocmd({ "BufWritePre" }, {
  group = EmiCastroGroup,
  pattern = "*",
  command = "%s/\\s\\+$//e",
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
