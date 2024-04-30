ColorMyPencils = function(color)
  color = color or "rose-pine-main"
  vim.cmd.colorscheme(color)

  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  -- {
  --   "folke/tokyonight.nvim",
  --   config = function()
  --     require("tokyonight").setup({
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  --       light_style = "day", -- The theme is used when the background is set to light
  --       transparent = true, -- Enable this to disable setting the background color
  --       terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  --       styles = {
  --         -- Style to be applied to different syntax groups
  --         -- Value is any valid attr-list value for `:help nvim_set_hl`
  --         comments = { italic = false },
  --         keywords = { italic = false },
  --         functions = {},
  --         variables = {},
  --         -- Background styles. Can be "dark", "transparent" or "normal"
  --         sidebars = "dark", -- style for sidebars, see below
  --         floats = "dark", -- style for floating windows
  --       },
  --     })
  --   end,
  -- },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "auto", -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,
        disable_background = false,
      })
      vim.cmd("colorscheme rose-pine-main")
      -- vim.cmd("colorscheme rose-pine-moon")
      -- vim.cmd("colorscheme rose-pine-dawn")
      ColorMyPencils()
    end,
  },
}
