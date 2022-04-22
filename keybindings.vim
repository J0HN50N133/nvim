""""""""""""""""""""""""""""""""""""""""""""""""""""
" _              _     _           _ _             "
"| | _____ _   _| |__ (_)_ __   __| (_)_ __   __ _ "
"| |/ / _ \ | | | '_ \| | '_ \ / _` | | '_ \ / _` |"
"|   <  __/ |_| | |_) | | | | | (_| | | | | | (_| |"
"|_|\_\___|\__, |_.__/|_|_| |_|\__,_|_|_| |_|\__, |"
"          |___/                             |___/ "
""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader="\<space>"
" 按<F3>打开或关闭目录树
nmap <F12> :edit ~/.config/nvim/init.vim<CR>
nmap <F5> :source ~/.config/nvim/init.vim<CR>
nmap W :w<CR>
nmap <silent> w <Plug>(coc-ci-w)
nmap <silent> b <Plug>(coc-ci-b)
noremap Q :bdelete<CR>
noremap gt :bn<CR>
noremap gT :bp<CR>
noremap gP :b#<CR>
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w><
noremap <c-right> <c-w>>
noremap <F3> :NERDTreeToggle<CR>
map <BS> :nohl<CR>
map f <Plug>Sneak_s
map F <Plug>Sneak_S
map t <Plug>Sneak_t
map T <Plug>Sneak_T
map j gj
map k gk
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""
"  ____           "
" / ___|___   ___ "
"| |   / _ \ / __|"
"| |__| (_) | (__ "
" \____\___/ \___|"
"""""""""""""""""""

" coc-translator
" popup
nmap <Leader>tt <Plug>(coc-translator-p)
vmap <Leader>tt <Plug>(coc-translator-pv)
" echo
nmap <Leader>te <Plug>(coc-translator-e)
vmap <Leader>te <Plug>(coc-translator-ev)
" replace
nmap <Leader>tr <Plug>(coc-translator-r)
vmap <Leader>tr <Plug>(coc-translator-rv)

nmap <silent> <leader>- <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>+ <Plug>(coc-diagnostic-next)
nmap <silent> <leader>od <Plug>(coc-definition)
nmap <silent> <M-]> <Plug>(coc-definition)
nmap <silent> <leader>ot <Plug>(coc-type-definition)
nmap <silent> <leader>oi <Plug>(coc-implementation)
nmap <silent> <leader>or <Plug>(coc-references)
nmap <silent> <leader>on <Plug>(coc-rename)
nmap <silent> <leader>oN <Plug>(coc-refactor)
nmap <silent> <leader>op :call CocActionAsync('format')<CR>
nmap <silent> <leader>of <Plug>(coc-fix-current)
"" actiono for file
nmap <silent> <M-CR> <Plug>(coc-codeaction-cursor)
nmap <silent> <leader>oaf <Plug>(coc-codeaction)
nmap <silent> <leader>oal <Plug>(coc-codeaction-line)
nmap <silent> <leader>oac <Plug>(coc-codeaction-cursor)
nmap <silent> <leader>oC <Plug>(coc-codelens-action)
nmap <silent> <leader>oh :call CocAction('doHover')<CR>
nmap <silent> <leader>op :call CocAction('definitionHover', 'preview')<CR>
vmap <leader>p  <Plug>(coc-format-selected)
nmap <leader>p  <Plug>(coc-format)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)

" Search workspace symbols.
nnoremap <silent><nowait> <space>ls  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>lf :CocList files<cr>

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
  :AsyncRun go run %
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

nmap <F2> :Vista!!<CR>
nnoremap <silent><M-\|> :Tags<CR>
nnoremap <silent><M-\> :Vista finder<CR>
"nnoremap <C-/> <plug>NERDCommenterToggle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                      _   _
"  ___  __ _ ___ _   _ _ __ ___   ___ | |_(_) ___  _ __
" / _ \/ _` / __| | | | '_ ` _ \ / _ \| __| |/ _ \| '_ \
"|  __/ (_| \__ \ |_| | | | | | | (_) | |_| | (_) | | | |
" \___|\__,_|___/\__, |_| |_| |_|\___/ \__|_|\___/|_| |_|
"                |___/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1
" j for jump
nmap <Leader>jf <Plug>(easymotion-bd-f)
nmap <Leader>jf <Plug>(easymotion-overwin-f)
nmap <Leader>js <Plug>(easymotion-overwin-f2)
nmap <Leader>jl <Plug>(easymotion-lineforward)
nmap <Leader>jj <Plug>(easymotion-j)
nmap <Leader>jk <Plug>(easymotion-k)
nmap <Leader>jh <Plug>(easymotion-linebackward)
nmap <Leader>jw <Plug>(easymotion-w)
nmap <Leader>jb <Plug>(easymotion-b)
nmap <Leader>je <Plug>(easymotion-e)

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


augroup vimbettersml
  au!

  " ----- Keybindings -----

  au FileType sml nnoremap <silent> <buffer> <leader>t :SMLTypeQuery<CR>
  au FileType sml nnoremap <silent> <buffer> gd :SMLJumpToDef<CR>

  " open the REPL terminal buffer
  au FileType sml nnoremap <silent> <buffer> <leader>is :SMLReplStart<CR>
  " close the REPL (mnemonic: k -> kill)
  au FileType sml nnoremap <silent> <buffer> <leader>ik :SMLReplStop<CR>
  " build the project (using CM if possible)
  au FileType sml nnoremap <silent> <buffer> <leader>ib :SMLReplBuild<CR>
  " for opening a structure, not a file
  au FileType sml nnoremap <silent> <buffer> <leader>io :SMLReplOpen<CR>
  " use the current file into the REPL (even if using CM)
  au FileType sml nnoremap <silent> <buffer> <leader>iu :SMLReplUse<CR>
  " clear the REPL screen
  au FileType sml nnoremap <silent> <buffer> <leader>ic :SMLReplClear<CR>
  " set the print depth to 100
  au FileType sml nnoremap <silent> <buffer> <leader>ip :SMLReplPrintDepth<CR>

  " ----- Other settings -----

  " Uncomment to try out conceal characters
  "au FileType sml setlocal conceallevel=2

  " Uncomment to try out same-width conceal characters
  "let g:sml_greek_tyvar_show_tick = 1
augroup END
