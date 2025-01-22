-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'https://github.com/tpope/vim-fugitive',
  'https://github.com/Mofiqul/vscode.nvim',
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
