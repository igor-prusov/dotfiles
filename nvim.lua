vim.keymap.set('','<F2>', '<cmd>NERDTreeToggle<CR>')
vim.keymap.set('','<F3>', '<cmd>TagbarToggle<CR>')
vim.keymap.set('','<F4>', '<cmd>UndotreeToggle<CR>')
vim.keymap.set('','<C-p>', '<cmd>FZF<CR>')

require('gitsigns').setup()

vim.cmd.colorscheme('habamax')


vim.keymap.set('','<leader>x', '<cmd>bdelete<CR>')
