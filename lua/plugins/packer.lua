-- ensure packer exists
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.g.coc_global_extensions = {
  "coc-actions",
  "coc-ci",
  "coc-clangd",
  "coc-dictionary",
  "coc-go",
  "coc-cmake",
  "coc-highlight",
  "coc-html",
  "coc-json",
  "coc-lists",
  "coc-marketplace",
  "coc-snippets",
  "coc-tag",
  "coc-translator",
  "coc-vimlsp",
  "coc-pyright",
  "coc-tsserver",
  "coc-git",
}

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here

--Plug 'junegunn/vim-easy-align'
  use {'junegunn/goyo.vim', cmd = 'Goyo'}
  use 'easymotion/vim-easymotion'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'AndrewRadev/splitjoin.vim'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-speeddating'
  use 'tpope/vim-repeat'
  use {'gelguy/wilder.nvim', requires = {'romgrk/fzy-lua-native'}}
  use 'skywind3000/vim-preview' 
  use 'skywind3000/vim-terminal-help' 
  use 'skywind3000/asyncrun.vim' 
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use 'preservim/nerdcommenter' 
  use 'justinmk/vim-sneak' 
  use 'ludovicchabant/vim-gutentags' 
--use 'skywind3000/gutentags_plus' 
  use 'jiangmiao/auto-pairs' 
  use 'gcmt/wildfire.vim' 
--use 'mg979/vim-visual-multi' 
  use {
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    },
    {
      'fannheyward/telescope-coc.nvim'
    },
  }
  use 'matze/vim-move'
  use {'junegunn/fzf', run = vim.fn['fzf#install']}
  use 'junegunn/fzf.vim'
  use 'jpalardy/vim-slime'
--highlight
  use 'sheerun/vim-polyglot'
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }
-- vcs 
  use 'tpope/vim-fugitive'
  use 'mhinz/vim-signify'

--Auto complete
  use {'neoclide/coc.nvim', branch='release'}

-- skirt
  use 'karb94/neoscroll.nvim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
--use 'itchyny/vim-cursorword'
  use 'luochen1990/rainbow'
  use 'morhetz/gruvbox'
--use 'mhartington/oceanic-next'
--use 'marko-cerovac/material.nvim'
--use 'sainnhe/sonokai'
  use 'ryanoasis/vim-devicons'
  use 'liuchengxu/vista.vim'
  use {
    "https://git.sr.ht/~nedia/auto-save.nvim",
    config = function()
      require("auto-save").setup( {
          events = { "InsertLeave", "BufLeave" },
          exclude_ft = { "NvimTree" },
        })
    end
  }
  use {'johnsonlee-debug/a.vim', ft = 'cpp'}
  use {'cdelledonne/vim-cmake', ft = 'cmake'}
--use {'tpope/vim-markdown', ft = 'markdown'}
  use {'lervag/vimtex', ft = 'tex'}
  use {'klafyvel/vim-slime-cells', ft = {'ocaml', 'haskell', 'python'}}
  use {'rust-lang/rust.vim', ft = 'rust'}
  --use {'numirias/semshi', ft = 'python', run = vim.fn[':UpdateRemotePlugins']}
  use {'python-mode/python-mode', ft = 'python', branch = 'develop'}
  use {'jmcantrell/vim-virtualenv', ft = 'python'}
  use {'fatih/vim-go', ft = 'go'}
  use {'vim-jp/vim-go-extra', ft = 'go'}
  use {'justinmk/vim-syntax-extra', ft = { 'yacc', 'lex' }}
  use {'neovimhaskell/haskell-vim', ft = 'haskell'}
  use {'jez/vim-better-sml', ft = 'sml' }
  use {'rescript-lang/vim-rescript', ft =  'rescript'}
  use {'rafcamlet/coc-nvim-lua', ft='lua'}
-- racket
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
-- coc plug
