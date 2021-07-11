let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack 
let g:cabal_indent_section = 2

nmap <leader>hl :call LoadCurrentFile()<CR><a-=><a-=>
nmap <leader>hr :call ReloadCurrentFile()<CR><a-=><a-=>
nmap <Leader>hg :H ghci<CR>
nmap <Leader>hc :H :! clear<CR>
func! LoadCurrentFile()
exec "w"
let strcmd = join(["H ghci -i", expand("%:t")]," ")
:execute strcmd
endfunc
func! ReloadCurrentFile()
exec "w"
let strcmd = join(["H :l", expand("%:t")]," ")
:execute strcmd
endfunc
