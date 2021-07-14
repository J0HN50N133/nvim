""""""""""""""""""""""""""""""""""""""
"                                 _  "
"  __ _  ___ _ __   ___ _ __ __ _| | "
" / _` |/ _ \ '_ \ / _ \ '__/ _` | | "
"| (_| |  __/ | | |  __/ | | (_| | | "
" \__, |\___|_| |_|\___|_|  \__,_|_| "
" |___/                              "
""""""""""""""""""""""""""""""""""""""
syntax enable
syntax on
set nu rnu
set undofile
set undodir=~/.vim/undodir
set autochdir
set hidden
set termguicolors
set ambiwidth=double
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab
set smarttab
set smartindent
set autoindent
autocmd FileType coffee,html,css,xml,yaml,json set sw=2 ts=2
set lazyredraw " Don't redraw when we don't have to
set autochdir
set hidden
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set termguicolors
set nostartofline " Don't reset cursor to start of line when moving around
set mouse=a
set mousehide
set wildmenu
set encoding=utf-8
set wrap "Wrap line
set linebreak
"外部文件改变自动读取
set autoread
"wildmenu忽略中间文件
set wildignore=*.o,*~
set ruler
"set cursorline cursorcolumn
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


""""""" auto fcitx """""""

let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx5-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx5-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx5-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx5-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * call Fcitx2en()
"进入插入模式
autocmd InsertEnter * call Fcitx2zh()

"##### auto fcitx end ######
"
function! s:get_visual_selection()
   let [lnum1, col1] = getpos("<")[1:2]
   let [lnum2, col2] = getpos(">")[1:2]
   let lines = getline(lnum1, lnum2)
   let line[-1] = line[-1][:col2 - (&selection == 'inclusive'?1:2)]
   let lines[0] = lines[0][col1 - 1:]
   return join(lines, "\n")
endfunction

