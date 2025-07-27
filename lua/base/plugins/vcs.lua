return {
  { 'tpope/vim-fugitive' },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
          else
            gitsigns.nav_hunk('next')
          end
        end, { desc = 'Next hunk' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
          else
            gitsigns.nav_hunk('prev')
          end
        end, { desc = 'Prev hunk' })

        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset hunk' })
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = 'Stage hunk' })
        map('v', '<leader>hr', function()
          gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = 'Reset hunk' })

        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
        map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'Preview hunk inline' })


        map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Diff this' })

        map('n', '<leader>hD', function()
          gitsigns.diffthis('~')
        end, { desc = 'Diff this with ~' })

        map('n', '<leader>hq', gitsigns.setqflist, { desc = 'Set quickfix list' })
        map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, { desc = 'Set quickfix list for all files' })

        map('n', '<leader>hb', function()
          gitsigns.blame_line({ full = true })
        end, { desc = 'Blame line' })
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle current line [b]lame' })
        map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = '[T]oggle [w]ord diff' })

        map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = '[I]nner [h]unk' })
      end,
    },
  },
}
