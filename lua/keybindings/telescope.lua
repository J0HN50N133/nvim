local pkg = 'keybindings.'
local km = vim.keymap
local Telescope = function(cmd) return string.format("Telescope %s", cmd)end - _to - Colon
km.set('n', '<leader>ff', Telescope('find_files'), {})
km.set('n', '<leader>fg', Telescope('live_grep'), {})
km.set('n', '<leader>fb', Telescope('buffers'), {})
km.set('n', '<leader>fh', Telescope('help_tags'), {})
km.set('n', Leader('fm'), Telescope('vim_bookmarks current_file'))
km.set('n', Leader('fM'), Telescope('vim_bookmarks all'))
