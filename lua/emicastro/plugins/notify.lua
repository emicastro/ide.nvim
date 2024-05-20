---@param bufnr number
local function highlightsInStacktrace(bufnr)
  vim.defer_fn(function()
    if not vim.api.nvim_buf_is_valid(bufnr) then
      return
    end
    vim.api.nvim_buf_call(bufnr, function()
      vim.fn.matchadd("WarningMsg", [[[^/]\+\.lua:\d\+\ze:]]) -- \ze: lookahead
    end)
  end, 1)
end

return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  opts = {
    render = "wrapped-compact", -- best for shorter max_width
    max_width = math.floor(vim.o.columns * 0.4),
    minimum_width = 15,
    top_down = false,
    -- level = vim.log.levels.TRACE, -- minimum severity
    timeout = 3000,
    -- stages = "slide", -- slide|fade
    -- icons = { ERROR = "", WARN = "▲", INFO = "●", TRACE = "", DEBUG = "" },
    on_open = function(win)
      -- set borderstyle
      if not vim.api.nvim_win_is_valid(win) then
        return
      end
      vim.api.nvim_win_set_config(win, { border = vim.g.borderStyle })

      local bufnr = vim.api.nvim_win_get_buf(win)
      highlightsInStacktrace(bufnr)
    end,
  },
}
