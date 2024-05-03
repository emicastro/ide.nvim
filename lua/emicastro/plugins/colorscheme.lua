ColorMyPencils = function(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)

  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  -- Use last-used colorscheme
  {
    "rafi/theme-loader.nvim",
    lazy = false,
    priority = 99,
    opts = { initial_colorscheme = "rose-pine-main" },
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "auto", -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
        },

        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },

        groups = {
          border = "muted",
          link = "iris",
          panel = "surface",

          error = "love",
          hint = "iris",
          info = "foam",
          note = "pine",
          todo = "rose",
          warn = "gold",

          git_add = "foam",
          git_change = "rose",
          git_delete = "love",
          git_dirty = "rose",
          git_ignore = "muted",
          git_merge = "iris",
          git_rename = "pine",
          git_stage = "iris",
          git_text = "rose",
          git_untracked = "subtle",

          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },

        highlight_groups = {
          LspFloatWinBorder = { fg = "pine" },
          TelescopeBorder = { fg = "pine" },
          TelescopePromptBorder = { fg = "pine" },
          TelescopeResultsBorder = { fg = "pine" },
          TelescopePreviewBorder = { fg = "gold" },
          TelescopePromptTitle = { fg = "text", bg = "pine" },
          TelescopePreviewTitle = { fg = "overlay", bg = "gold" },
          TelescopeResultsTitle = { fg = "text", bg = "pine" },

          -- Snippet suggestion colors
          CmpCompletionWindowBorder = { fg = "pine" },
          CmpItemKindSnippet = { fg = "rose", bg = "pine" },
          CmpItemKindKeyword = { fg = "gold", bg = "pine" },
          CmpItemKindText = { fg = "text", bg = "subtle" },
          CmpItemKindMethod = { fg = "gold", bg = "iris" },
          CmpItemKindConstructor = { fg = "gold", bg = "iris" },
          CmpItemKindFunction = { fg = "pine", bg = "rose" },
          CmpItemKindFolder = { fg = "surface", bg = "subtle" },
          CmpItemKindModule = { fg = "surface", bg = "subtle" },
          CmpItemKindConstant = { fg = "surface", bg = "gold" },
          CmpItemKindField = { fg = "overlay", bg = "foam" },
          CmpItemKindProperty = { fg = "overlay", bg = "foam" },
          CmpItemKindEnum = { fg = "gold", bg = "pine" },
          CmpItemKindUnit = { fg = "surface", bg = "subtle" },
          CmpItemKindClass = { fg = "text", bg = "love" },
          CmpItemKindVariable = { fg = "surface", bg = "gold" },
          CmpItemKindFile = { fg = "surface", bg = "subtle" },
          CmpItemKindInterface = { fg = "overlay", bg = "foam" },
          CmpItemKindColor = { fg = "gold", bg = "pine" },
          CmpItemKindReference = { fg = "overlay", bg = "foam" },
          CmpItemKindEnumMember = { fg = "surface", bg = "rose" },
          CmpItemKindStruct = { fg = "text", bg = "iris" },
          CmpItemKindValue = { fg = "surface", bg = "gold" },
          CmpItemKindEvent = { fg = "text", bg = "love" },
          CmpItemKindOperator = { fg = "text", bg = "iris" },
          CmpItemKindTypeParameter = { fg = "text", bg = "iris" },
          CmpItemKindCopilot = { fg = "overlay", bg = "foam" },
          -- Comment = { fg = "foam" },
          -- VertSplit = { fg = "muted", bg = "muted" },
        },
      })
      -- vim.cmd("colorscheme rose-pine")
      -- vim.cmd("colorscheme rose-pine-main")
      -- vim.cmd("colorscheme rose-pine-moon")
      -- vim.cmd("colorscheme rose-pine-dawn")
      -- ColorMyPencils()
    end,
  },

  {
    "projekt0n/github-nvim-theme",
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({})
    end,
  }, -- github_dark_default

  { "rebelot/kanagawa.nvim", lazy = true }, -- kanagawa-dragon, kanagawa-wave, kanagawa-lotus

  { "nyoom-engineering/oxocarbon.nvim", lazy = true },

  {
    "sam4llis/nvim-tundra",
    lazy = true,
    config = function()
      require("nvim-tundra").setup({
        transparent_background = false,
        plugins = {
          lsp = true,
          semantic_tokens = true,
          treesitter = true,
          telescope = true,
          nvimtree = true,
          cmp = true,
          context = true,
          gitsigns = true,
        },
        overwrite = {
          colors = {},
          highlights = {},
        },
      })

      vim.g.tundra_biome = "arctic" -- 'alpine', arctic' or 'jungle'
      -- vim.cmd("colorscheme tundra")
    end,
  },
}
