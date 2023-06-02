local pkg = 'plugins.'
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
                "git",
                "clone",
                "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable", -- latest stable release
                lazypath,
        })
end
vim.opt.rtp:prepend(lazypath)

-- temporary
vim.g.mapleader = " "
require('lazy').setup({
        -- My plugins here
        'rafcamlet/nvim-luapad',
        {
                'nathom/filetype.nvim',
                config = function()
                        vim.g.did_load_filetypes = 1
                end
        },
        { 'junegunn/goyo.vim',    cmd = 'Goyo' },
        {
                'ggandor/leap.nvim',
                dependencies = { 'tpope/vim-repeat' },
                config = function()
                        require('leap').add_default_mappings()
                end,
        },
        --'easymotion/vim-easymotion'
        'SirVer/ultisnips',
        'honza/vim-snippets',
        'AndrewRadev/splitjoin.vim',
        'tpope/vim-surround',
        { 'tpope/vim-unimpaired', keys = { '[<Space>', ']<Space>' } },
        'tpope/vim-repeat',
        {
                'gelguy/wilder.nvim',
                dependencies = { 'romgrk/fzy-lua-native' },
                keys = { "/", "?", ":" },
                config = function()
                        require(pkg .. 'wilder')
                end
        },
        'skywind3000/vim-preview',
        {
                'skywind3000/vim-terminal-help',
                keys = { "<m-=>", "<m-H>", "<m-L>", "<m-J>", "<m-K>", "<m-N>", "<m-q>", "<m-->" }
        },

        'skywind3000/asyncrun.vim',
        {
                'nvim-tree/nvim-tree.lua',
                dependencies = {
                        'nvim-tree/nvim-web-devicons', -- optional, for file icons
                },
                version = 'nightly',                   -- optional, updated every week. (see issue #1193)
                config = function() require(pkg .. 'nvim-tree') end,
                cmd = { 'NvimTreeOpen', 'NvimTreeClose', 'NvimTreeFocus', 'NvimTreeResize', 'NvimTreeToggle',
                        'NvimTreeRefresh',
                        'NvimTreeFindFile', 'NvimTreeCollapse', 'NvimTreeClipboard', 'NvimTreeFindFileToggle',
                        'NvimTreeCollapseKeepBuffers' },
        },
        {
                "GnikDroy/projections.nvim",
                config = function()
                        require('plugins.projections')
                end,
        },
        'preservim/nerdcommenter',
        {
                'ludovicchabant/vim-gutentags',
                config = function()
                        require(pkg .. 'gutentags')
                end
        },
        --'skywind3000/gutentags_plus'
        'jiangmiao/auto-pairs',
        'gcmt/wildfire.vim',
        --'mg979/vim-visual-multi',
        {
                {
                        'nvim-telescope/telescope.nvim',
                        version = '0.1.x',
                        config = function()
                                require(pkg .. 'telescope')
                        end,
                        dependencies = { { 'nvim-lua/plenary.nvim' } },
                },
                {
                        'fannheyward/telescope-coc.nvim',
                },
        },
        'fedepujol/move.nvim',
        { 'junegunn/fzf',               build = vim.fn['fzf#install'] },
        'junegunn/fzf.vim',
        --'jpalardy/vim-slime',
        --highlight
        --'sheerun/vim-polyglot',
        --Auto complete
        {
                'neoclide/coc.nvim',
                branch = 'release',
                config = function()
                        require(pkg .. 'coc')
                end
        },

        -- skirt
        {
                'karb94/neoscroll.nvim',
                config = function()
                        require('neoscroll').setup()
                end
        },
        {
                'nvim-lualine/lualine.nvim',
                config = function()
                        require(pkg .. 'lualine')
                end,
                dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
        },
        {
                'akinsho/bufferline.nvim',
                version = "v3.*",
                dependencies = 'nvim-tree/nvim-web-devicons',
                config = function()
                        require('bufferline').setup()
                end,
        },
        --'itchyny/vim-cursorword',
        'luochen1990/rainbow',
        'morhetz/gruvbox',
        'folke/tokyonight.nvim',
        --'mhartington/oceanic-next',
        --'marko-cerovac/material.nvim',
        --'sainnhe/sonokai',
        'ryanoasis/vim-devicons',
        'liuchengxu/vista.vim',
        { 'johnsonlee-debug/a.vim',     ft = 'cpp' },
        { 'cdelledonne/vim-cmake',      ft = 'cmake' },
        --{'tpope/vim-markdown', ft = 'markdown'},
        { 'lervag/vimtex',              ft = 'tex' },
        { 'klafyvel/vim-slime-cells',   ft = { 'ocaml', 'haskell', 'python' } },
        { 'rust-lang/rust.vim',         ft = 'rust' },
        --{'numirias/semshi', ft = 'python', build = vim.fn[':UpdateRemotePlugins']},
        { 'python-mode/python-mode',    ft = 'python',                        branch = 'develop' },
        { 'jmcantrell/vim-virtualenv',  ft = 'python' },
        { 'fatih/vim-go',               ft = 'go' },
        { 'vim-jp/vim-go-extra',        ft = 'go' },
        { 'justinmk/vim-syntax-extra',  ft = { 'yacc', 'lex' } },
        { 'neovimhaskell/haskell-vim',  ft = 'haskell' },
        { 'jez/vim-better-sml',         ft = 'sml' },
        { 'rescript-lang/vim-rescript', ft = 'rescript' },
        { 'rafcamlet/coc-nvim-lua',     ft = 'lua' },
        { 'dstein64/vim-startuptime' },
})
-- coc plug
