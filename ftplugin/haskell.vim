setlocal omnifunc=necoghc#omnifunc
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:necoghc_enable_detailed_browse = 1

" noremap <leader>t :HdevtoolsType<cr>
" noremap <leader>e :HdevtoolsClear<cr>

noremap <leader>t :GhcModType<cr>
noremap <leader>e :GhcModTypeClear<cr>
