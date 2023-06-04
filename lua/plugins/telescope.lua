local tele = require('telescope')
tele.load_extension('coc')
tele.load_extension('projections')
tele.load_extension('fzf')
tele.setup({
        extensions = {
                coc = {
                        theme = 'ivy',
                        prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
                }
        },
})
