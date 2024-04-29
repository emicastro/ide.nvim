return { -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    -- Prefer git instead of curl in order to improve connectivity in some environments
    require("nvim-treesitter.install").prefer_git = true

    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,

        -- Set this to `true` because ruby depends on 'syntax' being enabled for indentation.
        additional_vim_regex_highlighting = { "ruby" },
      },
      -- enable indentation
      indent = { enable = true, disable = { "ruby" } },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      auto_install = true,
      -- ensure these language parsers are installed
      ensure_installed = {
        "c",
        "cpp",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "ron",
        "rust",
        "toml",
        "bash",
        "lua",
        "luadoc",
        "sql",
        "vim",
        "vimdoc",
        "json",
        "xml",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "java",
        "http",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "graphql",
        "dockerfile",
        "gitignore",
        "query",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-y>",
          node_incremental = "<C-y>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
