
if empty(glob('~/.config/nvim/autoload/plug.vim'))
          silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
          autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set runtimepath^=~/.config/nvim runtimepath+=~/.config/nvim/after
let &packpath=&runtimepath
source ~/.config/nvim/general.vim
source ~/.config/nvim/plug_list.vim
source ~/.config/nvim/plugconf.vim
source ~/.config/nvim/apperance.vim
source ~/.config/nvim/keybindings.vim
luafile ~/.config/nvim/treesitter.lua
let conceallevel=3
