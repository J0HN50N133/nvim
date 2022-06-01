"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ambiwidth=single
let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_skip_empty_sections = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.colnr = ' col:'
let g:airline_symbols.linenr = ' line:'
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.dirty='⚡'
if(has("termguicolors"))
	set termguicolors
endif
colorscheme OceanicNext
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
set background=dark    " Setting dark mode
let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\   'ocaml': {
	\			'parentheses': ['start=/(\*\@!/ end=/)/ fold'],
	\		}
	\	}
	\}
