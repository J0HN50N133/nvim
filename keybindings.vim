""""""""""""""""""""""""""""""""""""""""""""""""""""
" _              _     _           _ _             "
"| | _____ _   _| |__ (_)_ __   __| (_)_ __   __ _ "
"| |/ / _ \ | | | '_ \| | '_ \ / _` | | '_ \ / _` |"
"|   <  __/ |_| | |_) | | | | | (_| | | | | | (_| |"
"|_|\_\___|\__, |_.__/|_|_| |_|\__,_|_|_| |_|\__, |"
"          |___/                             |___/ "
""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader="\<space>"
nmap W :w<CR>
noremap Q :bdelete<CR>
noremap gt :bn<CR>
noremap gT :bp<CR>
noremap gP :b#<CR>
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w><
noremap <c-right> <c-w>>
noremap <silent><leader>e :NvimTreeToggle<CR>
map <silent><BS> :nohl<CR>
map <silent>j gj
map <silent>k gk
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""
"  ____           "
" / ___|___   ___ "
"| |   / _ \ / __|"
"| |__| (_) | (__ "
" \____\___/ \___|"
"""""""""""""""""""

"" Give more space for displaying messages.
set cmdheight=2
"
"" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
"" delays and poor user experience.
"set updatetime=300
"
"" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"" compile and run
noremap <leader>r :call CompileRun()<CR>
func! CompileRun()
exec "w"
set splitbelow
if &filetype == 'c'
  :AsyncRun gcc % -o %<&& time ./%<
elseif &filetype == 'cpp'
  :AsyncRun g++ -O3 "%" -Wall -o "%<" -lpthread && time ./"%<"
elseif &filetype == 'java'
  :AsyncRun javac "%" && time java "%<"
elseif &filetype == 'sh'
  :AsyncRun time bash "%"
elseif &filetype == 'python'
  :AsyncRun python3 %
elseif &filetype == 'go'
  :AsyncRun -mode=terminal go run .
elseif &filetype == 'racket'
  :AsyncRun racket %
elseif &filetype == 'tex'
  :VimtexCompile
  " special for database experiment
elseif &filetype == 'haskell'
  :AsyncRun runghc -Wall %
elseif &filetype == 'rust'
  :RustRun
elseif &filetype == 'ocaml'
  :AsyncRun ocaml %
endif
endfunc

""""""""""""""""""""""""
"           _          "
" _ __ ___ (_)___  ___ "
"| '_ ` _ \| / __|/ __|"
"| | | | | | \__ \ (__ "
"|_| |_| |_|_|___/\___|"
"                      "
""""""""""""""""""""""""

"nmap <F2> :Vista!!<CR>
nnoremap <silent><M-\|> :Vista finder<CR>
nnoremap <silent><M-\> :BTags<CR>
inoremap <silent><M-\> <C-O>:BTags<CR>
"nnoremap <silent><M-\> :Vista finder<CR>

nmap <Leader>li  <plug>(vimtex-info)
nmap <Leader>lt  <plug>(vimtex-toc-open)
nmap <Leader>lT  <plug>(vimtex-toc-toggle)
nmap <Leader>lv  <plug>(vimtex-view)
nmap <Leader>ll  <plug>(vimtex-compile)
nmap <Leader>lo  <plug>(vimtex-compile-output)
nmap <Leader>lg  <plug>(vimtex-status)
nmap <Leader>lG  <plug>(vimtex-status-all)
nmap <Leader>lc  <plug>(vimtex-clean)
nmap <Leader>lC  <plug>(vimtex-clean-full)
nmap dse              <plug>(vimtex-env-delete)
nmap dsc              <plug>(vimtex-cmd-delete)
nmap cse              <plug>(vimtex-env-change)
nmap csc              <plug>(vimtex-cmd-change)
nmap <F7>             <plug>(vimtex-cmd-create)
nmap ]]               <plug>(vimtex-delim-close)
