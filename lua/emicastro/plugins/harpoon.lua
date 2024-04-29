return {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup({
      settings = {
        sync_on_ui_close = true,
      },
    })
    -- REQUIRED

    -- pipe harpoon list view to telescope
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local finder = function()
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        return require("telescope.finders").new_table({
          results = file_paths,
        })
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = finder(),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
          layout_config = {
            height = 0.5,
            width = 0.75,
            prompt_position = "top",
            preview_cutoff = 120,
          },

          -- allows to remove an item with `<C-r>`
          attach_mappings = function(prompt_bufnr, map)
            map("i", "<C-r>", function()
              local state = require("telescope.actions.state")
              local selected_entry = state.get_selected_entry()
              local current_picker = state.get_current_picker(prompt_bufnr)

              table.remove(harpoon_files.items, selected_entry.index)
              current_picker:refresh(finder())
            end)
            return true
          end,
        })
        :find()
    end

    vim.keymap.set("n", "<C-e>", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })

    vim.keymap.set("n", "<C-a>", function()
      harpoon:list():add()
    end, { desc = "Adds current buffer to harpoon" })

    vim.keymap.set("n", "<leader>hc", function()
      harpoon:list():clear()
    end, { desc = "Clear harpoon's list" })

    vim.keymap.set("n", "<C-z>", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<C-x>", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<C-b>", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<C-m>", function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<C-S-N>", function()
      harpoon:list():next()
    end)

    -- The 'extend' functionality can be used
    -- to add keymaps for opening files in splits & tabs.
    harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-v>", function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-x>", function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-t>", function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })
      end,
    })
  end,
}
