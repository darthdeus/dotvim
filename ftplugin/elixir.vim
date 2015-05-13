nmap <buffer> <leader>e :!mix test<cr>
nmap <buffer> <leader>t :VimuxRunCommand("mix test")<cr>
noremap <buffer> <leader>gt :CommandTFlush<cr>\|:CommandT ./test<cr>
