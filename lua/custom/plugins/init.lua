-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'eandrju/cellular-automaton.nvim',
    config = function()
      vim.keymap.set('n', '<leader>mr', '<cmd>CellularAutomaton make_it_rain<CR>', { desc = '[m]ake it [r]ain' })
      vim.keymap.set('n', '<leader>ml', '<cmd>CellularAutomaton game_of_life<CR>', { desc = '[m]ake game of [l]ife' })
    end,
  },
}
