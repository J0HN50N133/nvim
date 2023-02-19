local km = vim.keymap
local builtin = require('telescope.builtin')
vim.g.mapleader = " "
km.set('n', '<leader>ff', builtin.find_files, {})
km.set('n', '<leader>fg', builtin.live_grep, {})
km.set('n', '<leader>fb', builtin.buffers, {})
km.set('n', '<leader>fh', builtin.help_tags, {})