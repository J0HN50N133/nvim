"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

""""""""""""""""Tool""""""""""""""""""""""""""""""
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim',{'on':'Goyo'}
Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'skywind3000/vim-preview'
Plug 'skywind3000/vim-terminal-help'
Plug 'skywind3000/asyncrun.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'justinmk/vim-sneak'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'jiangmiao/auto-pairs'
Plug 'gcmt/wildfire.vim'
Plug 'mg979/vim-visual-multi'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'matze/vim-move'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
"""" python
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'numirias/semshi', {'for': 'python', 'do': ':UpdateRemotePlugins'}
Plug 'jpalardy/vim-slime'
"highlight
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"""" vcs """"
Plug 'mhinz/vim-signify'

"""""""""""""""""""Plug-For-language""""""""""""""""""""""
"Auto complete
Plug 'neoclide/coc.nvim',{'branch':'release'}

Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'lervag/vimtex', {'for': 'tex'}

Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}

"" go
Plug 'fatih/vim-go',{'for':'go'}
Plug 'vim-jp/vim-go-extra',{'for':'go'}
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh'  }
Plug 'AndrewRadev/splitjoin.vim'

""" rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}

""" skirt
Plug 'terryma/vim-smooth-scroll'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/vim-cursorword'
Plug 'luochen1990/rainbow'
Plug 'morhetz/gruvbox'

"" language tools"
Plug 'dense-analysis/ale'
Plug 'theniceboy/vim-deus'
Plug 'ianding1/leetcode.vim',{'on':['LeetCodeList','LeetCodeSignIn']}
Plug 'liuchengxu/vista.vim'
Plug 'yggdroot/indentLine', {'for':['go', 'c', 'cpp', 'java', 'sh', 'scheme', 'haskell']}

""flex/bison"
Plug 'justinmk/vim-syntax-extra', {'for':['yacc', 'lex']}
"" Haskell"
Plug 'neovimhaskell/haskell-vim',{'for':['haskell']}

"" sml "
Plug 'jez/vim-better-sml',{'for':['sml']}

""""racket""""

call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" =====
" ===== coc.nvim
" =====
set hidden
set updatetime=100
let g:coc_global_extensions = [
            \"coc-actions",
            \"coc-ci",
            \"coc-clangd",
            \"coc-dictionary",
            \"coc-go",
            \"coc-highlight",
            \"coc-html",
            \"coc-json",
            \"coc-lists",
            \"coc-marketplace",
            \"coc-snippets",
            \"coc-tag",
            \"coc-translator",
            \"coc-vimlsp",
            \"coc-go",
            \"coc-pyright"]
