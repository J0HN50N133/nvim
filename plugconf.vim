"""""""elm-vim"""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
"             _             _                   "
"  __ _ _   _| |_ ___ _ __ | |_ __ _  __ _ ___  "
" / _` | | | | __/ _ \ '_ \| __/ _` |/ _` / __| "
"| (_| | |_| | ||  __/ | | | || (_| | (_| \__ \ "
" \__, |\__,_|\__\___|_| |_|\__\__,_|\__, |___/ "
" |___/                              |___/      "
"""""""""""""""""""""""""""""""""""""""""""""""""
let $GTAGSLABEL = 'native'
"let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/share/gtags/gtags.conf'
let g:airline#extensions#tabline#enabled = 1
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" " 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif
" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
let g:gutentags_define_advanced_commands = 1

"""""""""""""""""""""""""""""""""""""""""""""""""
"    _                                          "
"   / \   ___ _   _ _ __   ___ _ __ _   _ _ __  "
"  / _ \ / __| | | | '_ \ / __| '__| | | | '_ \ "
" / ___ \\__ \ |_| | | | | (__| |  | |_| | | | |"
"/_/   \_\___/\__, |_| |_|\___|_|   \__,_|_| |_|"
"             |___/                             "
"""""""""""""""""""""""""""""""""""""""""""""""""

"自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 5

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:asyncrun_open = 8
let g:ale_lint_on_save                = 1
let g:ale_fix_on_save                 = 1
let g:ale_linters = {
\ 'ocaml': ['ocamllsp'],
\}
let g:ale_fixers = {
\   'ocaml':      ['ocamlformat'],
\   '*':          ['remove_trailing_lines', 'trim_whitespace'],
\}

hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                      _   _
"  ___  __ _ ___ _   _ _ __ ___   ___ | |_(_) ___  _ __
" / _ \/ _` / __| | | | '_ ` _ \ / _ \| __| |/ _ \| '_ \
"|  __/ (_| \__ \ |_| | | | | | | (_) | |_| | (_) | | | |
" \___|\__,_|___/\__, |_| |_| |_|\___/ \__|_|\___/|_| |_|
"                |___/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

""""""""""""""""""""""""""""""""""""""
" _           _                _
"| | ___  ___| |_ ___ ___   __| | ___
"| |/ _ \/ _ \ __/ __/ _ \ / _` |/ _ \
"| |  __/  __/ || (_| (_) | (_| |  __/
"|_|\___|\___|\__\___\___/ \__,_|\___|
"
""""""""""""""""""""""""""""""""""""""

let g:leetcode_browser = 'firefox'
let g:leetcode_china = 1
let g:leetcode_solution_filetype = 'golang'
let g:leetcode_hide_paid_only = 1

"""""""""""""""""""""""""""
"       _     _
"__   _(_)___| |_ __ _
"\ \ / / / __| __/ _` |
" \ V /| \__ \ || (_| |
"  \_/ |_|___/\__\__,_|
"
"""""""""""""""""""""""""""
let g:vista_default_executive = 'coc'
let g:vista_echo_cursor = 0
let g:vista_executive_for = {
                  \ 'scheme': 'ctags',
                  \ 'c': 'ctags',
                  \}
"let g:vista_fzf_preview = ['bottom:30%']
"let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 0
"let g:vista#renderer#icons = {
"\   "function": "\uf794",
"\   "variable": "\uf71b",
"\  }


"""""vimtex"""""
let g:tex_flavor = 'latex'
let g:vimtex_view_method='zathura'
set conceallevel=1
let g:tex_conceal='abdmg'

""""""""""vim-slime""""""""""
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}

"""""polyglot"""""
let g:polyglot_disabled = ['sensible']

"""""signify"""""
set updatetime=100
let g:signify_vcs_list = ['git']
let g:signify_sign_show_text = 1
