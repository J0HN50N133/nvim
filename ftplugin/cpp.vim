nnoremap <silent><M-\|> :Telescope coc workspace_symbols<CR>
nnoremap <silent><M-\> :Telescope coc document_symbols<CR>
inoremap <silent><M-\> <C-O>:Telescope coc document_symbols<CR>

command! S :CocCommand clangd.switchSourceHeader
