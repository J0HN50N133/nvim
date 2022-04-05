"let g:opamshare = substitute(system('opam var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"
set rtp^="/home/johnsonlee/.opam/4.14.0/share/ocp-indent/vim"
