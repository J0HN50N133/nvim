local g = vim.g
local fn = vim.fn

vim.cmd.colorscheme('gruvbox')
vim.o.background = 'dark'
g.airline_theme='gruvbox'
g.airline_powerline_fonts = 1
g.airline_skip_empty_sections = 1
g.airline_symbols = {
	branch = '',
	readonly = '',
	colnr = ' col:',
	linenr = ' line:',
	maxlinenr = ' ',
	dirty = '✘',
}
g.rainbow_active = 1

g.rainbow_conf = {
	ctermfgs = { "lightblue", "lightyellow", "lightcyan", "lightmagenta" },
	guifgs = { "royalblue3", "darkorange3", "seagreen3", "firebrick" },
	operators = "_,_",
	parentheses = { "start=/(/ end=/)/ fold", "start=/\\[/ end=/\\]/ fold", "start=/{/ end=/}/ fold" },
	separately = {
		["*"] = vim.empty_dict(),
		css = 0,
		html = {
		parentheses = { "start=/\\v\\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\\z([-_:a-zA-Z0-9]+)(\\s+[-_:a-zA-Z0-9]+(\\=(\"[^\"]*\"|'[^']*'|[^ '\"><=`]*))?)* \\>/ end=#</\\z1># fold" }
	},
	lisp = {
		guifgs = { "royalblue3", "darkorange3", "seagreen3", "firebrick", "darkorchid3" }
	},
	ocaml = {
	parentheses = { "start=/(\\*\\@!/ end=/)/ fold" }
},
tex = {
			parentheses = { "start=/(/ end=/)/", "start=/\\[/ end=/\\]/" }
		},
		vim = {
			parentheses = { "start=/(/ end=/)/", "start=/\\[/ end=/\\]/", "start=/{/ end=/}/ fold", "start=/(/ end=/)/ containedin=vimFuncBody", "start=/\\[/ end=/\\]/ containedin=vimFuncBody", "start=/{/ end=/}/ fold containedin=vimFuncBody" }
		}
	}
}
