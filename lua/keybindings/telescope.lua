local pkg = 'keybindings.'
local km = vim.keymap
local Telescope = function(cmd) return string.format("Telescope %s", cmd)end - _to - Colon
km.set('n', Leader('ff'), Telescope('find_files'), {})
km.set('n', Leader('fg'), Telescope('live_grep'), {})
km.set('n', Leader('fb'), Telescope('buffers'), {})
km.set('n', Leader('fh'), Telescope('help_tags'), {})
km.set('n', Leader('fm'), Telescope('vim_bookmarks current_file'))
km.set('n', Leader('fM'), Telescope('vim_bookmarks all'))
km.set({'i','n'}, '<M-Bar>', Telescope('coc workspace_symbols'))
km.set({'i','n'}, '<M-Bslash>', Telescope('coc document_symbols'))
