return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "gopls",
        "clangd",
        "zls",
        "autotools_ls",
        "sqls",
        "bashls",
        "dockerls",
        "jsonls",
        "lua_ls",
        "html",
        "htmx",
        "marksman",
        "taplo",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "clang-format",
        "gofumpt",
        "golines",
        "goimports",
        "gotests",
        "gci",
        "delve",
        "codelldb",
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "eslint_d",
        "jq",
      },
    })
  end,
}
