return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme kanagawa-wave]])
    end,
  },
  {
    'echasnovski/mini.statusline',
    version = false,
    opts = { use_icons = false },
  },
  { 'j-hui/fidget.nvim', opts = {} },
}
