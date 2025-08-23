return {
  "ibhagwan/fzf-lua",
  config = function()
    local fzf = require('fzf-lua')
    fzf.setup({
      'max-perf',
      keymap = {
        fzf = {
          ['alt-p'] = 'toggle-preview',
        },
      },
    })

    local function map(l, r, desc)
      vim.keymap.set('n', l, r, { desc = desc })
    end
    map('grr', fzf.lsp_references, '[G]oto [R]eferences')
    map('gri', fzf.lsp_implementations, '[G]oto [I]mplementations')
    map('grd', fzf.lsp_definitions, '[G]oto [D]efinitions')
    map('gO', fzf.lsp_document_symbols, 'Open Document Symbols')
    map('grt', fzf.lsp_typedefs, '[G]oto [T]ype Definition')
    map('<leader>sh', fzf.help_tags, '[S]earch [H]elp')
    map('<leader>sk', fzf.keymaps, '[S]earch [K]eymaps')
    map('<leader>sf', fzf.files, '[S]earch [F]iles')
    map('<leader>sw', fzf.grep_cword, '[S]earch current [W]ord')
    map('<leader>sg', fzf.live_grep_native, '[S]earch by [G]rep')
    map('<leader>sd', fzf.diagnostics_workspace, '[S]earch [D]iagnostics')
    map('<leader>sr', fzf.resume, '[S]earch [R]esume')
    map('<leader>s.', fzf.oldfiles, '[S]earch Recent Files ("." for repeat)')
    map('<leader><leader>', fzf.buffers, '[ ] Find existing buffers')
    map('<leader>/', fzf.lgrep_curbuf, '[/] Fuzzily search in current buffer')
    local function find_config_files()
      fzf.files { cwd = vim.fn.stdpath 'config' }
    end
    map('<leader>sn', find_config_files, '[S]earch [N]eovim files')
  end,
}
