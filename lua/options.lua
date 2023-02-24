local o = vim.o
local cmd = vim.cmd
local fn = vim.fn
local au = vim.api.nvim_create_autocmd

o.hidden = true
o.updatetime = 300
o.conceallevel = 3
o.nu = true
o.rnu = true
o.undofile = true
o.backup = false
o.writebackup = false
o.expandtab = true
o.smarttab = true
o.smartindent = true
o.autoindent = true
o.tabstop=8
o.softtabstop=8
o.shiftwidth=8
o.ambiwidth='single'
o.autowrite=true
o.showmode=false --Don't show the current mode (airline.vim takes care of us)
o.startofline=false --Don't reset cursor to start of line when moving around
o.mouse = 'a'
o.encoding='utf-8'
o.colorcolumn=80
o.wildignore="*.o,*~,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store"
o.scrolloff=3 -- Start scrolling three lines before horizontal border of window
o.clipboard="unnamedplus"
o.ttimeoutlen=150
o.mousehide = true
o.wildmenu = true
o.wrap = true
o.autoread = true
o.ruler = true
o.cursorline = true
o.cursorcolumn = true
o.compatible = false
o.magic  = true -- Enable extended regexes
vim.opt.sessionoptions:append('localoptions')
if vim.fn.has('termguicolors') then
  o.termguicolors = true
end

au("FileType", {
    pattern = {"html", "css", "xml", "yaml", "json"},
    callback = 'set sw = 2 ts = 2'
  })

au({"FocusGained","BufEnter"}, {
    pattern = {"*"},
    callback = function() vim.cmd.checktime() end
  })

if fn.has('autocmd') == 1 then
  au("BufReadPost", {
      pattern = {"*.rkt", "rktl"},
      callback = function() vim.bo.filetype = 'racket' end,
    })
  au("BufReadPost", {
      pattern = {"*.rkt", "rktl"},
      callback = function() vim.bo.filetype = 'asm' end,
    })
end
