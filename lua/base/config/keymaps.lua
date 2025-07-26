vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>')

vim.keymap.set('v', '<leader>cp', '"+y', { desc = 'Copy to clipboard' })
vim.keymap.set('n', '<leader>cv', '"+p', { desc = 'Paste from clipboard' })

vim.keymap.set('n', 'grD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
