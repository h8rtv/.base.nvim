return {
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nordic').load()
    end,
  },
  {
    'echasnovski/mini.statusline',
    version = false,
    opts = { use_icons = false },
  },
}
