return {
  {
    'yorumicolors/yorumi.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme yorumi')
    end,
  },
  {
    'echasnovski/mini.statusline',
    version = false,
    opts = { use_icons = false },
  },
  { 'j-hui/fidget.nvim', opts = {} },
}
