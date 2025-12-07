return {
  'rebelot/kanagawa.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    -- Load the colorscheme here.
    -- Wave theme: warm-hearted, balanced colors
    -- Available themes: kanagawa-wave, kanagawa-dragon, kanagawa-lotus
    vim.cmd.colorscheme 'kanagawa-wave'
  end,
}
