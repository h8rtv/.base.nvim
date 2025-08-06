return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  event = 'VimEnter',
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
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local themes = require('telescope.themes')
    local builtin = require('telescope.builtin')

    pcall(telescope.load_extension, 'fzf')
    pcall(telescope.load_extension, 'ui-select')

    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
            ['<C-d>'] = actions.delete_buffer,
          }
        }
      },
      extensions = {
        ['ui-select'] = themes.get_dropdown
      },
    }

    local function map(l, r, desc)
      vim.keymap.set('n', l, r, { desc = desc })
    end
    map('grr', builtin.lsp_references, '[G]oto [R]eferences')
    map('gri', builtin.lsp_implementations, '[G]oto [I]mplementations')
    map('grd', builtin.lsp_definitions, '[G]oto [D]efinitions')
    map('gO', builtin.lsp_document_symbols, 'Open Document Symbols')
    map('grt', builtin.lsp_type_definitions, '[G]oto [T]ype Definition')
    map('<leader>sh', builtin.help_tags, '[S]earch [H]elp')
    map('<leader>sk', builtin.keymaps, '[S]earch [K]eymaps')
    map('<leader>sf', builtin.find_files, '[S]earch [F]iles')
    map('<leader>sw', builtin.grep_string, '[S]earch current [W]ord')
    map('<leader>sg', builtin.live_grep, '[S]earch by [G]rep')
    map('<leader>sd', builtin.diagnostics, '[S]earch [D]iagnostics')
    map('<leader>sr', builtin.resume, '[S]earch [R]esume')
    map('<leader>s.', builtin.oldfiles, '[S]earch Recent Files ("." for repeat)')
    map('<leader><leader>', builtin.buffers, '[ ] Find existing buffers')
    local function curr_buf_fuzzy_find()
      builtin.current_buffer_fuzzy_find(themes.get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end
    map('<leader>/', curr_buf_fuzzy_find, '[/] Fuzzily search in current buffer')
    local function find_config_files()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end
    map('<leader>sn', find_config_files, '[S]earch [N]eovim files')
  end,
}
