set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Rails specific keystrokes
noremap <leader>gr :topleft :split config/routes.rb<CR>
noremap <leader>gg :topleft 50 :split Gemfile<CR>

noremap <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
noremap <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
noremap <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
noremap <leader>gs :CommandTFlush<cr>\|:CommandT app/services<cr>
noremap <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
noremap <leader>gd :CommandTFlush<cr>\|:CommandT app/decorators<cr>
noremap <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
noremap <leader>gt :CommandTFlush<cr>\|:CommandT spec<cr>
noremap <leader>gk :CommandTFlush<cr>\|:CommandT app/assets/stylesheets<cr>
noremap <leader>gj :CommandTFlush<cr>\|:CommandT app/assets/javascripts<cr>
noremap <leader>ga :CommandTFlush<cr>\|:CommandT app/assets/javascripts/templates<cr>
noremap <leader>ge :CommandTFlush<cr>\|:CommandT app/cells<cr>

noremap <leader>da :CommandTFlush<cr>\|:CommandT app/assets/javascripts/templates<cr>
noremap <leader>dv :CommandTFlush<cr>\|:CommandT app/assets/javascripts/views<cr>
noremap <leader>dc :CommandTFlush<cr>\|:CommandT app/assets/javascripts/controllers<cr>
noremap <leader>dr :CommandTFlush<cr>\|:CommandT app/assets/javascripts/routes<cr>
noremap <leader>dm :CommandTFlush<cr>\|:CommandT app/assets/javascripts/models<cr>

