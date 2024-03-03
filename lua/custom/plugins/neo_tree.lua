return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require('neo-tree').setup {
        window = {
          ['P'] = { 'toggle_preview', config = { use_float = true, use_image = false } },
        },
        popup_border_style = 'rounded',
        opts = {
          filesystem = {
            filtered_items = {
              hide_dotfiles = false,
              hide_gitignored = true,
            },
          },
        },
      }
      vim.keymap.set('n', '<leader>t', '<cmd>Neotree float reveal<CR>', { desc = 'Open [F]iletree' })
    end,
  },
}
