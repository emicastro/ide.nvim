-- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      -- cmdline = {
      --     view = "cmdline",
      -- },

      vim.keymap.set("n", "<leader>nd", function()
        require("noice").cmd("disable")
      end),

      vim.keymap.set("n", "<leader>nl", function()
        require("noice").cmd("last")
      end),

      vim.keymap.set("n", "<leader>nh", function()
        require("noice").cmd("history")
      end),

      -- The cmdline stays open, so you can change the command and execute it again.
      vim.keymap.set("c", "<S-Enter>", function()
        require("noice").redirect(vim.fn.getcmdline())
      end, { desc = "Redirect Cmdline" }),

      -- NOTE: not needed now
      -- LSP Hover Doc Scrolling

      -- vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
      --   if not require("noice.lsp").scroll(4) then
      --     return "<c-f>"
      --   end
      -- end, { silent = true, expr = true }),
      --
      -- vim.keymap.set({ "n", "i", "s" }, "<c-b>", function()
      --   if not require("noice.lsp").scroll(-4) then
      --     return "<c-b>"
      --   end
      -- end, { silent = true, expr = true })
    })
  end,
}
