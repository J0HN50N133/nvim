vim.loader.enable()
require('bootstrap')
require('plugins')
require('options')
require('appearance')
require('keybindings')
require('custommand')
vim.cmd.source('~/.config/nvim/plugconf.vim')
vim.cmd.source('~/.config/nvim/keybindings.vim')
