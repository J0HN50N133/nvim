local tele = require('telescope')
local bookmark_actions = require('telescope').extensions.vim_bookmarks.actions

tele.setup({
        extensions = {
                coc = {
                        theme = 'ivy',
                        prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
                },
                vim_bookmarks = {
                        mappings = {
                                n = {
                                        ["dd"] = bookmark_actions.delete_selected_or_at_cursor,
                                        ["da"] = bookmark_actions.delete_all
                                },
                                i = {
                                        ["<C-d>"] = bookmark_actions.delete_selected_or_at_cursor,
                                }
                        },
                }
        },
})
tele.load_extension('coc')
tele.load_extension('projections')
tele.load_extension('fzf')
tele.load_extension('vim_bookmarks')
