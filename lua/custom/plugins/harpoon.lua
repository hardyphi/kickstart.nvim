return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()
      -- basic telescope configuration
      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end

      vim.keymap.set('n', '<C-i>', function()
        toggle_telescope(harpoon:list())
      end, { desc = 'kpen harpoon window' })

      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():append()
      end, { desc = '[a]dd to harpoon' })
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'open harpoon menu' })

      vim.keymap.set('n', '<leader>n', function()
        harpoon:list():select(1)
      end, { desc = 'open harpoon file 1' })
      vim.keymap.set('n', '<leader>e', function()
        harpoon:list():select(2)
      end, { desc = 'open harpoon file 2' })
      vim.keymap.set('n', '<leader>i', function()
        harpoon:list():select(3)
      end, { desc = 'open harpoon file 3' })
      vim.keymap.set('n', '<leader>o', function()
        harpoon:list():select(4)
      end, { desc = 'open harpoon file 4' })

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end)
    end,
  },
}
