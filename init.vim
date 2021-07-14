
"""""" __  ____   ____     _____ __  __ 
""""""|  \/  \ \ / /\ \   / /_ _|  \/  |
""""""| |\/| |\ V /  \ \ / / | || |\/| |
""""""| |  | | | |    \ V /  | || |  | |
""""""|_|  |_| |_|     \_/  |___|_|  |_|
""""""
if empty(glob('~/.config/nvim/autoload/plug.vim'))
          silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
          autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set runtimepath^=~/.config/nvim runtimepath+=~/.config/nvim/after
let &packpath=&runtimepath
source ~/.config/nvim/general.vim
source ~/.config/nvim/apperance.vim
source ~/.config/nvim/plugconf.vim
source ~/.config/nvim/plugList.vim
source ~/.config/nvim/keybindings.vim

autocmd FileType go source ~/.config/nvim/lang/go.vim
autocmd FileType python source ~/.config/nvim/lang/python.vim
autocmd FileType racket source ~/.config/nvim/lang/racket.vim
autocmd FileType haskell source ~/.config/nvim/lang/haskell.vim
