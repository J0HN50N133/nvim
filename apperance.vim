"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 双字宽显示特殊字符
set ambiwidth=double
let g:airline_theme='deus'
colorscheme deus
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:deus_termcolors=256
"set background=dark    " Setting dark mode

let g:rainbow_active=1
let g:rainbow_load_separately = [
      \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
      \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
      \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
      \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
      \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta', 'cyan']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
