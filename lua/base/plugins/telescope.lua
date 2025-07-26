return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ['<C-q>'] =
              require('telescope.actions').smart_send_to_qflist +
              require('telescope.actions').open_qflist,
          ['<C-d>'] = 'delete_buffer',
        }
      }
    },
    extensions = {
      ['ui-select'] = {
        require('telescope.themes').get_dropdown(),
      },
    },
  },
  init = function()
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
  end,
  keys = {
    { 'grr',              require('telescope.builtin').lsp_references,           desc = '[G]oto [R]eferences' },
    { 'gri',              require('telescope.builtin').lsp_implementations,      desc = '[G]oto [I]mplementations' },
    { 'grd',              require('telescope.builtin').lsp_definitions,          desc = '[G]oto [D]efinitions' },
    { 'gO',               require('telescope.builtin').lsp_document_symbols,     desc = 'Open Document Symbols' },
    { 'grt',              require('telescope.builtin').lsp_type_definitions,     desc = '[G]oto [T]ype Definition' },
    { '<leader>sh',       require('telescope.builtin').help_tags,                desc = '[S]earch [H]elp' },
    { '<leader>sk',       require('telescope.builtin').keymaps,                  desc = '[S]earch [K]eymaps' },
    { '<leader>sf',       require('telescope.builtin').find_files,               desc = '[S]earch [F]iles' },
    { '<leader>sw',       require('telescope.builtin').grep_string,              desc = '[S]earch current [W]ord' },
    { '<leader>sg',       require('telescope.builtin').live_grep,                desc = '[S]earch by [G]rep' },
    { '<leader>sd',       require('telescope.builtin').diagnostics,              desc = '[S]earch [D]iagnostics' },
    { '<leader>sr',       require('telescope.builtin').resume,                   desc = '[S]earch [R]esume' },
    { '<leader>s.',       require('telescope.builtin').oldfiles,                 desc = '[S]earch Recent Files ("." for repeat)' },
    { '<leader><leader>', function() require('telescope.builtin').buffers() end, desc = '[ ] Find existing buffers' },
    {
      '<leader>/',
      function()
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end,
      desc = '[/] Fuzzily search in current buffer',
    },
    {
      '<leader>sn',
      function()
        require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = '[S]earch [N]eovim files',
    },
  },
}
