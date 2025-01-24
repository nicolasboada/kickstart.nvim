-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'https://github.com/ThePrimeagen/vim-be-good',
  'https://github.com/Mofiqul/vscode.nvim',
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration
    },
    config = true,
  },
  {
    'https://github.com/tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', ':G<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>gp', ':Git push<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>gl', ':Git pull<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>gd', ':Gdiffsplit<CR>', { noremap = true, silent = true })
    end,
  },
  {
    'github/copilot.vim',
    init = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
    end,
    config = function()
      vim.keymap.set('i', '<Tab>', 'copilot#AcceptLine()', { expr = true })
      vim.keymap.set('i', '<C-j>', '<Plug>(copilot-next)', { noremap = false })
      vim.keymap.set('i', '<C-k>', '<Plug>(copilot-previous)', { noremap = false })
    end,
  },
}
