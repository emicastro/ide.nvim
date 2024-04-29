return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    -- Set lualine as statusline
    -- See `:help lualine.txt`
    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "powerline",
        --component_separators = '|',
        --section_separators = '',
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
          {
            "rest",
            icon = "",
            fg = "#428890",
          },
        },
      },
    })
  end,
}
