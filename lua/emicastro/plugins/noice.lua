-- DOCS https://github.com/folke/noice.nvim#-routes
local routes = {
  -----------------------------------------------------------------------------
  -- REDIRECT TO MINI

  -- write/deletion messages
  { filter = { event = "msg_show", kind = "", find = "%d+B written$" }, view = "mini" },
  { filter = { event = "msg_show", find = "%d+L, %d+B$" }, view = "mini" },
  { filter = { event = "msg_show", find = "%-%-No lines in buffer%-%-" }, view = "mini" },

  -- unneeded info on search patterns
  { filter = { event = "msg_show", find = "^E486: Pattern not found" }, view = "mini" },

  -- Word added to spellfile via `zg`
  { filter = { event = "msg_show", find = "^Word .*%.add$" }, view = "mini" },

  -- nvim-treesitter
  { filter = { event = "msg_show", find = "^%[nvim%-treesitter%]" }, view = "mini" },
  { filter = { event = "notify", find = "All parsers are up%-to%-date" }, view = "mini" },

  { -- Mason
    filter = {
      event = "notify",
      cond = function(msg)
        return msg.opts and (msg.opts.title or ""):find("mason")
      end,
    },
    view = "mini",
  },
  -----------------------------------------------------------------------------
  -- SKIP

  -- LSP bugs?
  { filter = { event = "msg_show", find = "lsp_signature? handler RPC" }, skip = true },
  {
    filter = { event = "msg_show", find = "^%s*at process.processTicksAndRejections" },
    skip = true,
  },

  -- code actions
  { filter = { event = "notify", find = "No code actions available" }, skip = true },

  -- unneeded info on search patterns
  { filter = { event = "msg_show", find = "^[/?]." }, skip = true },

  -- :make
  { filter = { event = "msg_show", find = "^:!make" }, skip = true },
  { filter = { event = "msg_show", find = "^%(%d+ of %d+%):" }, skip = true },

  -- E211 no longer needed, since auto-closing deleted buffers
  { filter = { event = "msg_show", find = "E211: File .* no longer available" }, skip = true },
}

--------------------------------------------------------------------------------

-- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = true,

  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },

  keys = {
    { "<leader>nh", vim.cmd.NoiceHistory, mode = { "n", "x" }, desc = "󰎟 Noice Log" },
    { "<leader>nl", vim.cmd.NoiceLast, mode = { "n", "x" }, desc = "󰎟 Noice Last" },
  },

  opts = {
    routes = routes,

    -- add any options here
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },

    -- DOCS https://github.com/folke/noice.nvim/blob/main/lua/noice/config/views.lua
    views = {
      -- Classic command line
      -- cmdline = {
      --     view = "cmdline",
      -- },

      cmdline_popup = {
        border = { style = vim.g.borderStyle },
      },
      mini = {
        timeout = 2000,
        zindex = 10, -- lower, so it does not cover nvim-notify
        position = { col = -3 }, -- to the left to avoid collision with scrollbar
        format = { "{title} ", "{message}" }, -- leave out "{level}"
      },
      hover = {
        border = { style = vim.g.borderStyle },
        size = { max_width = 80 },
        win_options = { scrolloff = 4, wrap = true },
      },
      popup = {
        border = { style = vim.g.borderStyle },
        size = { width = 90, height = 25 },
        win_options = { scrolloff = 8, wrap = true, concealcursor = "nv" },
        close = { keys = { "q", "<D-w>", "<D-9>", "<D-0>" } },
      },
      split = {
        enter = true,
        size = "50%",
        win_options = { scrolloff = 6 },
        close = { keys = { "q", "<D-w>", "<D-9>", "<D-0>" } },
      },
    },
    commands = {
      {
        "<Esc>",
        function()
          vim.snippet.stop()
          vim.cmd.NoiceDismiss()
        end,
        desc = "󰎟 Clear Notifications & Snippet",
      },
      history = {
        view = "split",
        filter_opts = { reverse = true }, -- show newest entries first
        -- https://github.com/folke/noice.nvim#-formatting
        opts = { format = { "{title} ", "{cmdline} ", "{message}" } },
      },
      last = {
        view = "popup",
        -- https://github.com/folke/noice.nvim#-formatting
        opts = { format = { "{title} ", "{cmdline} ", "{message}" } },
      },
    },
  },

  config = function()
    local noice = require("noice")
    noice.setup({
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },

      -----------------------------------------------------------------------
      -- add keymaps
      vim.keymap.set("n", "<leader>nd", function()
        noice.cmd("disable")
      end, { desc = "Noice disable" }),

      -- The cmdline stays open, so you can change the command and execute it again.
      vim.keymap.set("c", "<S-Enter>", function()
        noice.redirect(vim.fn.getcmdline())
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
