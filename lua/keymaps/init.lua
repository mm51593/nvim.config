vim.g.mapleader = " "

vim.keymap.set("n", "<leader>n", ":noh<CR>", { desc = "No highlight" })
vim.keymap.set('n', '<CR>', 'o<Esc>')
vim.keymap.set('n', '<BS>', 'X')
vim.keymap.set('n', 'q:', '<Nop>')

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

vim.keymap.set('n', 'U', '<C-r>')
