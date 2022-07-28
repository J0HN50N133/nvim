""""""""""""""wilder""""""""""""""
let s:scale = ['#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
      \ '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
      \ '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
      \ '#c8d43a', '#bfde43', '#b6e84e', '#aff05b']
let s:gradient = map(s:scale, {i, fg -> wilder#make_hl(
      \ 'WilderGradient' . i, 'Pmenu', [{}, {}, {'foreground': fg}]
      \ )})
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'language': 'python',
      \       'fuzzy': 2,
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': wilder#python_fuzzy_pattern(),
      \       'sorter': wilder#python_difflib_sorter(),
      \       'engine': 're',
      \     }),
      \   ),
      \ ])
call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_palette_theme({
      \ 'border': 'double',
      \ 'max_height': '75%',
      \ 'min_height': 0,
      \ 'prompt_position': 'top',
      \ 'reverse': 0,
      \ 'pumblend':20,
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'left': [
      \   ' ', wilder#popupmenu_devicons(),
      \ ],
      \ 'right': [
      \         ' ', wilder#popupmenu_scrollbar(),
      \ ],
      \ })))
"""""""""""""""""""""""gutentags""""""""""""""""""""""""""
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

"""""""""""""""""""""""asyncrun""""""""""""""""""""""""""

"自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 5

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
"
"""""""""""""""""""""""easymotion""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

"""""""""""""""""""""""vista""""""""""""""""""""""""""""""""""""""""
let g:vista_default_executive = 'coc'
let g:vista_echo_cursor = 0
let g:vista_executive_for = {
                  \ 'scheme': 'ctags',
                  \ 'c': 'ctags',
                  \}
"let g:vista_fzf_preview = ['bottom:30%']
let g:vista_echo_cursor_strategy='floating_win'
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 0
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }


"""""vimtex"""""
let g:tex_flavor = 'latex'
let g:vimtex_view_method='zathura'
set conceallevel=1
let g:tex_conceal='abdmg'

""""""""""vim-slime""""""""""
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_cell_delimiter = "^\\s*##"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}
let g:slime_dont_ask_default = 1
let g:slime_bracketed_paste = 0
let g:slime_preserve_curpos = 0
" vim-slime-cells
nmap <c-c><c-s> <Plug>SlimeSendCell
nmap <c-c><CR> <Plug>SlimeCellsSendAndGoToNext
nmap <c-c><c-Down> <Plug>SlimeCellsNext
nmap <c-c><c-Up> <Plug>SlimeCellsPrev

"""""signify"""""
set updatetime=100
let g:signify_vcs_list = ['git']
let g:signify_sign_show_text = 1

""""""auto pair""""""
au FileType ocaml let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"', "`":"`"}
au FileType rescript let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"', "`":"`"}

""""""coc""""""
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"""""""""""which key"""""""""""
set timeoutlen=500
