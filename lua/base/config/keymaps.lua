vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<cr>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')

vim.keymap.set('v', '<leader>cp', '"+y', { desc = 'Copy to clipboard' })
vim.keymap.set('n', '<leader>cv', '"+p', { desc = 'Paste from clipboard' })

local function async_format()
  vim.lsp.buf.format { async = true }
end
vim.keymap.set('n', '<leader>fo', async_format, { desc = '[F][o]rmat file' })
vim.keymap.set('n', 'grD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })
