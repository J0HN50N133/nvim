local wilder = require('wilder')
local gradient = {
  '#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
  '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
  '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
  '#c8d43a', '#bfde43', '#b6e84e', '#aff05b'
}

for i, fg in ipairs(gradient) do
  gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', {{a = 1}, {a = 1}, {foreground = fg}})
end

wilder.set_option('renderer', wilder.popupmenu_renderer({
  highlights = {
    gradient = gradient, -- must be set
    -- selected_gradient key can be set to apply gradient highlighting for the selected candidate.
  },
  highlighter = wilder.highlighter_with_gradient({
    wilder.basic_highlighter(), -- or wilder.lua_fzy_highlighter(),
  }),
}))
wilder.setup({modes = {':', '/', '?'}})
-- Disable Python remote plugin
wilder.set_option('use_python_remote_plugin', 0)

wilder.set_option('pipeline', {
  wilder.branch(
    wilder.cmdline_pipeline({
      fuzzy = 1,
      fuzzy_filter = wilder.lua_fzy_filter(),
    }),
    wilder.vim_search_pipeline()
  )
})

 wilder.set_option('renderer', wilder.renderer_mux({
       [':'] = wilder.popupmenu_renderer(
         wilder.popupmenu_border_theme(
           {
             highlighter = wilder.highlighter_with_gradient({ wilder.lua_fzy_highlighter() }),
             min_width = '100%', -- minimum height of the popupmenu, can also be a number
             min_height = '50%', -- to set a fixed height, set max_height to the same value
             reverse = 1,        -- if 1, shows the candidates from bottom to top
             left = {' ', wilder.popupmenu_devicons()},
             right = { ' ', wilder.popupmenu_scrollbar() },
             pumblend = 50,
             highlights = {
               gradient = gradient,
             },
           }
         )),
   ['/'] = wilder.wildmenu_renderer({
     highlighter = wilder.lua_fzy_highlighter(),
   }),
 }))

