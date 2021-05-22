if !exists('g:terminal_key')
      let g:terminal_key = '<m-=>'
endif

if !exists('g:terminal_cwd')
      let g:terminal_cwd = 1
endif

if !exists('g:terminal_rootmarkers')
      let g:terminal_rootmarkers = ['.git', '.svn', '.root', '.project', '.hg']
endif

let $VIM_SERVERNAME = v:servername
let $VIM_EXE = v:progpath

let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
