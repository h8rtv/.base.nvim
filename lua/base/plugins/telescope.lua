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
              function()
                require('telescope.actions').smart_send_to_qflist()
                require('telescope.actions').open_qflist(69)
              end ,
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
    { 'grr',              function() require('telescope.builtin').lsp_references() end,       desc = '[G]oto [R]eferences' },
    { 'gri',              function() require('telescope.builtin').lsp_implementations() end,  desc = '[G]oto [I]mplementations' },
    { 'grd',              function() require('telescope.builtin').lsp_definitions() end,      desc = '[G]oto [D]efinitions' },
    { 'gO',               function() require('telescope.builtin').lsp_document_symbols() end, desc = 'Open Document Symbols' },
    { 'grt',              function() require('telescope.builtin').lsp_type_definitions() end, desc = '[G]oto [T]ype Definition' },
    { '<leader>sh',       function() require('telescope.builtin').help_tags() end,            desc = '[S]earch [H]elp' },
    { '<leader>sk',       function() require('telescope.builtin').keymaps() end,              desc = '[S]earch [K]eymaps' },
    { '<leader>sf',       function() require('telescope.builtin').find_files() end,           desc = '[S]earch [F]iles' },
    { '<leader>sw',       function() require('telescope.builtin').grep_string() end,          desc = '[S]earch current [W]ord' },
    { '<leader>sg',       function() require('telescope.builtin').live_grep() end,            desc = '[S]earch by [G]rep' },
    { '<leader>sd',       function() require('telescope.builtin').diagnostics() end,          desc = '[S]earch [D]iagnostics' },
    { '<leader>sr',       function() require('telescope.builtin').resume() end,               desc = '[S]earch [R]esume' },
    { '<leader>s.',       function() require('telescope.builtin').oldfiles() end,             desc = '[S]earch Recent Files ("." for repeat)' },
    { '<leader><leader>', function() require('telescope.builtin').buffers() end,              desc = '[ ] Find existing buffers' },
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
