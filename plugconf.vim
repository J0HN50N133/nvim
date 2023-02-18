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
                  \ 'cpp': 'ctags',
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
