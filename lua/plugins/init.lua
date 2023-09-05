local pkg = 'plugins.'
-- temporary
vim.g.mapleader = " "
require('lazy').setup({
        -- My plugins here
        { 'rafcamlet/nvim-luapad', cmd = 'Luapad' },
        { 'junegunn/goyo.vim',     cmd = 'Goyo' },
        {
                'ggandor/leap.nvim',
                dependencies = { 'tpope/vim-repeat', keys = '.' },
                keys = {
                        { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
                        { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
                        { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
                },
                config = function()
                        require('leap').add_default_mappings(true)
                        vim.keymap.del({ "x", "o" }, "x")
                        vim.keymap.del({ "x", "o" }, "X")
                end,
        },
        --'easymotion/vim-easymotion'
        'SirVer/ultisnips',
        { 'honza/vim-snippets',        event = 'VeryLazy' },
        { 'AndrewRadev/splitjoin.vim', keys = { 'gS', 'gJ' } },
        {
                { 'tpope/vim-surround',   event = 'VeryLazy' },
                { 'tpope/vim-unimpaired', keys = { '[<Space>', ']<Space>' } },
                --{'tpope/vim-markdown', ft = 'markdown'},
                'tpope/vim-repeat',
        },
        {
                'gelguy/wilder.nvim',
                dependencies = { 'romgrk/fzy-lua-native' },
                keys = { "/", "?", ":" },
                config = function()
                        require(pkg .. 'wilder')
                end
        },
        {
                'andymass/vim-matchup',
                keys = '%',
                cmd = { 'MatchupWhereAmI' }
        },
        {
                'skywind3000/vim-preview',
                {
                        'skywind3000/vim-terminal-help',
                        keys = { "<m-=>", "<m-H>", "<m-L>", "<m-J>", "<m-K>", "<m-N>", "<m-q>", "<m-->" }
                },

                { 'skywind3000/asyncrun.vim', cmd = 'AsyncRun' },
                --'skywind3000/gutentags_plus'
        },
        {
                'nvim-treesitter/nvim-treesitter',
                event = 'VeryLazy',
                build = function()
                        vim.cmd.TSUpdate()
                end,
                config = function()
                        require(pkg .. 'treesitter')
                end
        },
        {
                'nvim-treesitter/nvim-treesitter-context',
                dependencies = 'nvim-treesitter/nvim-treesitter'
        },
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
                branch = 'pre_release'
        },
        { 'preservim/nerdcommenter', keys = { '<leader>c<space>', '<leader>cc' } },
        {
                'ludovicchabant/vim-gutentags',
                config = function()
                        require(pkg .. 'gutentags')
                end
        },
        { "windwp/nvim-autopairs",   config = function() require("nvim-autopairs").setup {} end },
        { 'gcmt/wildfire.vim',       keys = { '<CR>' } },
        --'mg979/vim-visual-multi',
        {
                {
                        'nvim-telescope/telescope.nvim',
                        version = '0.1.x',
                        config = function()
                                require(pkg .. 'telescope')
                        end,
                        cmd = "Telescope",
                        dependencies = { 'nvim-lua/plenary.nvim' },
                },
                {
                        'nvim-telescope/telescope-fzf-native.nvim',
                        build = 'make'
                },
                {
                        'fannheyward/telescope-coc.nvim',
                        lazy = true
                },
                {
                        'johnsonlee-debug/telescope-vim-bookmarks.nvim',
                        dependencies = { 'MattesGroeger/vim-bookmarks' }
                },
                {
                        'sudormrfbin/cheatsheet.nvim',

                        dependencies = {
                                { 'nvim-telescope/telescope.nvim' },
                                { 'nvim-lua/popup.nvim' },
                                { 'nvim-lua/plenary.nvim' },
                        }
                },
                {
                        {
                                'stevearc/dressing.nvim',
                                opts = {},
                        },
                        {
                                'stevearc/overseer.nvim',
                                opts = {},
                        },
                },
        },
        'fedepujol/move.nvim',
        { 'junegunn/fzf',         build = vim.fn['fzf#install'] },
        --highlight
        { 'sheerun/vim-polyglot', enabled = false },
        { 'rcarriga/nvim-notify' },
        --Auto complete
        {
                'neoclide/coc.nvim',
                branch = 'release',
                lazy = false,
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
                event = "VeryLazy",
                config = function()
                        require(pkg .. 'lualine')
                end,
                dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
        },
        {
                'akinsho/bufferline.nvim',
                event = "VeryLazy",
                version = "v3.*",
                dependencies = 'nvim-tree/nvim-web-devicons',
                config = function()
                        require('bufferline').setup()
                end,
        },
        --'itchyny/vim-cursorword',
        { 'luochen1990/rainbow',   event = 'VeryLazy' },
        { 'morhetz/gruvbox',       lazy = true },
        { 'folke/tokyonight.nvim', lazy = true },
        --'mhartington/oceanic-next',
        --'marko-cerovac/material.nvim',
        --'sainnhe/sonokai',
        'ryanoasis/vim-devicons',
        { 'liuchengxu/vista.vim',       cmd = { 'Vista' } },
        { 'johnsonlee-debug/a.vim',     ft = 'cpp' },
        { 'cdelledonne/vim-cmake',      ft = 'cmake' },
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
        { 'folke/neodev.nvim' },
})
-- coc plug
