""""""""""""""""""""""""""""""""""""""
"                                 _  "
"  __ _  ___ _ __   ___ _ __ __ _| | "
" / _` |/ _ \ '_ \ / _ \ '__/ _` | | "
"| (_| |  __/ | | |  __/ | | (_| | | "
" \__, |\___|_| |_|\___|_|  \__,_|_| "
" |___/                              "
""""""""""""""""""""""""""""""""""""""
syntax on
set nu rnu
set autowrite
set undofile
set undodir=~/.vim/undodir
set autochdir
set hidden
set ambiwidth=double
set tabstop=8
set softtabstop=8
set shiftwidth=8
set expandtab
set smarttab
set smartindent
set autoindent
autocmd FileType html,css,xml,yaml,json set sw=2 ts=2
"set lazyredraw " Don't redraw when we don't have to
set hidden
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around
set mouse=a
set mousehide
set wildmenu
set encoding=utf-8
set colorcolumn=80
set wrap "Wrap line
"外部文件改变自动读取
set autoread
"wildmenu忽略中间文件
set wildignore=*.o,*~
set ruler
set cursorline cursorcolumn
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set nocompatible
set magic " Enable extended regexes
set scrolloff=3 " Start scrolling three lines before horizontal border of window
set clipboard=unnamedplus
filetype plugin indent on
au FocusGained,BufEnter * checktime

if has("autocmd")
 au BufReadPost *.rkt,*.rktl set filetype=racket
 au filetype racket set lisp
 au filetype racket set autoindent
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""
"           _          "
" _ __ ___ (_)___  ___ "
"| '_ ` _ \| / __|/ __|"
"| | | | | | \__ \ (__ "
"|_| |_| |_|_|___/\___|"
"                      "
""""""""""""""""""""""""

nnoremap <silent><Leader><Leader> /<++><CR>:nohlsearch<CR>ca<

set ttimeoutlen=150
