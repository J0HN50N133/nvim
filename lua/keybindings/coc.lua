local pkg = 'keybindings.'
require(pkg .. 'utils')

local km = vim.keymap
local keyset = km.set
--- @param cmd string
-- return coc-`cmd`
local function Coc(cmd)
  return string.format("coc-%s", cmd)
end
local function CocKy(keyseq)
  return Leader('o' .. keyseq)
end

local PlugCoc = Coc - _to - Plug

keyset('n', 'w', PlugCoc("ci-w"), { silent = true })
keyset('n', 'b', PlugCoc("ci-b"), { silent = true })

-- Coc translator
--- @key string
-- return keybinding in keybinding space of coc-translator
function TrnsKy(key)
  return Leader('t' .. key)
end

-- popup
local trans = function(arg) return string.format("translator-%s", arg) end - _to - PlugCoc
km.set('n', TrnsKy('t'), trans('p'))
km.set('v', TrnsKy('t'), trans('pv'))
-- echo
km.set('n', TrnsKy('e'), trans('e'))
km.set('v', TrnsKy('e'), trans('ev'))
-- replace
km.set('n', TrnsKy('r'), trans('r'))
km.set('v', TrnsKy('r'), trans('rv'))

local opts = { silent = true, nowait = true }

local jump_action_table = {
  -- action            preview jump
  jumpDefinition     = { 'd', 'D' },
  jumpDeclaration    = { 'c', 'C' },
  jumpTypeDefinition = { 't', 'T' },
  jumpImplementation = { 'i', 'I' },
  jumpReferences     = { 'r', 'R' }
}
for action, keys in pairs(jump_action_table) do
  for _, key in ipairs(keys) do
    keyset('n', CocKy(key), function() vim.fn.CocAction(action, key == key:upper()) end, opts)
  end
end
keyset('n', CocKy('o'), Colon('CocOutline'), opts)
keyset('n', CocKy('-'), PlugCoc('diagnostic-prev'), opts)
keyset('n', CocKy('+'), PlugCoc('diagnostic-next'), opts)
keyset('n', CocKy('n'), PlugCoc('rename'), opts)
keyset('n', CocKy('N'), PlugCoc('refactor'), opts)
keyset('n', CocKy('p'), CocActionAsync('format'), opts)
keyset('n', CocKy('f'), PlugCoc('fix-current'), opts)
keyset('n', Alt('CR'), PlugCoc('codeaction-cursor'), opts)
keyset('n', CocKy('af'), PlugCoc('codeaction'), opts)
keyset('n', CocKy('al'), PlugCoc('codeaction-line'), opts)
keyset('n', CocKy('l'), PlugCoc('codelens-action'), opts)
keyset('v', Leader('p'), PlugCoc('format-selected'), opts)
keyset('n', Leader('p'), PlugCoc('format'), opts)
keyset({ 'x', 'o' }, 'if', PlugCoc('funcobj-i'), opts)
keyset({ 'x', 'o' }, 'af', PlugCoc('funcobj-a'), opts)
-- Use K to show documentation in preview window.
function _G.show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

keyset('n', 'K', _G.show_docs)
-- navigate chunks of current buffer
local git = function(arg) return string.format("git-%s", arg) end - _to - PlugCoc
keyset('n', Leader('[g'), git('prevchunk'))
keyset('n', Leader(']g'), git('nextchunk'))
-- navigate conflicts of current buffer
keyset('n', Leader('[c'), git('prevconflict'))
keyset('n', Leader(']c'), git('nextconflict'))
-- show chunk diff at current position
keyset('n', Leader('gs'), git('chunkinfo'))
-- show commit contains current position
keyset('n', Leader('gc'), git('commit'))
keyset({ 'o', 'x' }, 'ig', git('chunk-inner'))
keyset({ 'o', 'x' }, 'ag', git('chunk-outer'))
keyset({ 'n' }, 'gb', Colon('CocCommand git.showBlameDoc'))
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
