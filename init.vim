
"""""" __  ____   ____     _____ __  __ 
""""""|  \/  \ \ / /\ \   / /_ _|  \/  |
""""""| |\/| |\ V /  \ \ / / | || |\/| |
""""""| |  | | | |    \ V /  | || |  | |
""""""|_|  |_| |_|     \_/  |___|_|  |_|
""""""
set runtimepath^=~/.config/nvim runtimepath+=~/.config/nvim/after
let &packpath=&runtimepath
source ~/.config/nvim/general.vim
source ~/.config/nvim/apperance.vim
source ~/.config/nvim/plugList.vim
source ~/.config/nvim/plugconf.vim
source ~/.config/nvim/keybindings.vim

autocmd FileType go source ~/.config/nvim/lang/go.vim
autocmd FileType python source ~/.config/nvim/lang/python.vim
autocmd FileType scheme source ~/.config/nvim/lang/scheme.vim
