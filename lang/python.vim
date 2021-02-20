"let g:repl_predefine_python = {
      "\'numpy': 'import numpy as np',
      "\'matplotlib':'from matplotlib import pyplot as plt'
      "\}
"" F8 make break point
"autocmd FileType python nnoremap <F8> <Esc>:REPLDebugStopAtCurrentLine<Cr>
"" F6 doesn't step into a function
"autocmd FileType python nnoremap <F6> <Esc>:REPLDBN<Cr>
"" F7 step into a function
"autocmd FileType python nnoremap <F7> <Esc>:REPLDBS<Cr>

