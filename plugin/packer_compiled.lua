-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/johnsonlee/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/johnsonlee/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/johnsonlee/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/johnsonlee/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/johnsonlee/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["a.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/opt/a.vim",
    url = "https://github.com/johnsonlee-debug/a.vim"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/asyncrun.vim",
    url = "https://github.com/skywind3000/asyncrun.vim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["ctrlp.vim"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/ctrlp.vim",
    url = "https://github.com/ctrlpvim/ctrlp.vim"
  },
  fzf = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["goyo.vim"] = {
    commands = { "Goyo" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/opt/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["haskell-vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/opt/haskell-vim",
    url = "https://github.com/neovimhaskell/haskell-vim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  nerdtree = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["python-mode"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/opt/python-mode",
    url = "https://github.com/python-mode/python-mode"
  },
  rainbow = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/rainbow",
    url = "https://github.com/luochen1990/rainbow"
  },
  ["rust.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/opt/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/vim-airline/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vim-airline-themes",
    url = "https://github.com/vim-airline/vim-airline-themes"
  },
  ["vim-better-sml"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vim-better-sml",
    url = "https://github.com/jez/vim-better-sml"
  },
  ["vim-cmake"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vim-cmake",
    url = "https://github.com/cdelledonne/vim-cmake"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vim-easymotion",
    url = "https://github.com/easymotion/vim-easymotion"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-go"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vim-go",
    url = "https://github.com/fatih/vim-go"
  },
  ["vim-go-extra"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vim-go-extra",
    url = "https://github.com/vim-jp/vim-go-extra"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vim-gutentags",
    url = "https://github.com/ludovicchabant/vim-gutentags"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vim-move",
    url = "https://github.com/matze/vim-move"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-preview"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vim-preview",
    url = "https://github.com/skywind3000/vim-preview"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rescript"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vim-rescript",
    url = "https://github.com/rescript-lang/vim-rescript"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vim-signify",
    url = "https://github.com/mhinz/vim-signify"
  },
  ["vim-slime"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vim-slime",
    url = "https://github.com/jpalardy/vim-slime"
  },
  ["vim-slime-cells"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vim-slime-cells",
    url = "https://github.com/klafyvel/vim-slime-cells"
  },
  ["vim-smooth-scroll"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vim-smooth-scroll",
    url = "https://github.com/terryma/vim-smooth-scroll"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vim-sneak",
    url = "https://github.com/justinmk/vim-sneak"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-speeddating"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vim-speeddating",
    url = "https://github.com/tpope/vim-speeddating"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-syntax-extra"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vim-syntax-extra",
    url = "https://github.com/justinmk/vim-syntax-extra"
  },
  ["vim-terminal-help"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vim-terminal-help",
    url = "https://github.com/skywind3000/vim-terminal-help"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-virtualenv"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vim-virtualenv",
    url = "https://github.com/jmcantrell/vim-virtualenv"
  },
  ["vim-which-key"] = {
    commands = { "WhichKey", "WhichKey!" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vim-which-key",
    url = "https://github.com/liuchengxu/vim-which-key"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  },
  ["wilder.nvim"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  },
  ["wildfire.vim"] = {
    loaded = true,
    path = "/home/johnsonlee/.local/share/nvim/site/pack/packer/start/wildfire.vim",
    url = "https://github.com/gcmt/wildfire.vim"
  }
}

time([[Defining packer_plugins]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Goyo', function(cmdargs)
          require('packer.load')({'goyo.vim'}, { cmd = 'Goyo', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'goyo.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Goyo ', 'cmdline')
      end})
pcall(vim.cmd, [[au CmdUndefined WhichKey! ++once lua require"packer.load"({'vim-which-key'}, {}, _G.packer_plugins)]])
pcall(vim.api.nvim_create_user_command, 'WhichKey', function(cmdargs)
          require('packer.load')({'vim-which-key'}, { cmd = 'WhichKey', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-which-key'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('WhichKey ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType cmake ++once lua require("packer.load")({'vim-cmake'}, { ft = "cmake" }, _G.packer_plugins)]]
vim.cmd [[au FileType ocaml ++once lua require("packer.load")({'vim-slime-cells'}, { ft = "ocaml" }, _G.packer_plugins)]]
vim.cmd [[au FileType rescript ++once lua require("packer.load")({'vim-rescript'}, { ft = "rescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType haskell ++once lua require("packer.load")({'vim-slime-cells', 'haskell-vim'}, { ft = "haskell" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust.vim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType lex ++once lua require("packer.load")({'vim-syntax-extra'}, { ft = "lex" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'vim-virtualenv', 'vim-slime-cells', 'python-mode'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'vim-go-extra', 'vim-go'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType yacc ++once lua require("packer.load")({'vim-syntax-extra'}, { ft = "yacc" }, _G.packer_plugins)]]
vim.cmd [[au FileType sml ++once lua require("packer.load")({'vim-better-sml'}, { ft = "sml" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'a.vim'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vim-rescript/ftdetect/rescript.vim]], true)
vim.cmd [[source /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vim-rescript/ftdetect/rescript.vim]]
time([[Sourcing ftdetect script at: /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vim-rescript/ftdetect/rescript.vim]], false)
time([[Sourcing ftdetect script at: /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], true)
vim.cmd [[source /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]]
time([[Sourcing ftdetect script at: /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], false)
time([[Sourcing ftdetect script at: /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vim-better-sml/ftdetect/sml.vim]], true)
vim.cmd [[source /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vim-better-sml/ftdetect/sml.vim]]
time([[Sourcing ftdetect script at: /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vim-better-sml/ftdetect/sml.vim]], false)
time([[Sourcing ftdetect script at: /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/haskell-vim/ftdetect/haskell.vim]], true)
vim.cmd [[source /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/haskell-vim/ftdetect/haskell.vim]]
time([[Sourcing ftdetect script at: /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/haskell-vim/ftdetect/haskell.vim]], false)
time([[Sourcing ftdetect script at: /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], true)
vim.cmd [[source /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]]
time([[Sourcing ftdetect script at: /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], false)
time([[Sourcing ftdetect script at: /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], true)
vim.cmd [[source /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]]
time([[Sourcing ftdetect script at: /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], false)
time([[Sourcing ftdetect script at: /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], true)
vim.cmd [[source /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]]
time([[Sourcing ftdetect script at: /home/johnsonlee/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
