-- telescope
require('telescope').setup()
vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>g', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>h', '<cmd>Telescope help_tags<cr>')
vim.keymap.set('n', '<leader>r', '<cmd>Telescope oldfiles<cr>')
