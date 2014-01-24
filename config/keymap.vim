" Buffer resizing with arrow keys
nnoremap <Up> <C-w>5-
nnoremap <Down> <C-w>5+
nnoremap <Left> <C-w>5<
nnoremap <Right> <C-w>5>

nnoremap - :Switch<cr>

" Expand %% to directory path of current buffer
cnoremap %% <C-R>=expand('%:h').'/'<CR>
noremap <leader>e :edit %%
noremap <leader>v :view %%
" open file in a tab
" map <Leader>te :tabe %%

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>


" Open files with <leader>f
noremap <leader>f  :CommandTFlush<cr>\|:CommandT<CR>
" Open files, limited to the directory of the current files, with <leader>gf
noremap <leader>F  :CommandTFlush<cr>\|:CommandT %%<CR>
noremap <leader>gf :CommandTFlush<cr>\|:CommandT %%<CR>

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

nnoremap <C-a> ^
nnoremap <C-e> $

" For easier navigation between windows
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
" Bubble multiple lines
vnoremap <C-Up> <C-w><C-k>
vnoremap <C-Down> <C-w><C-j>
vnoremap <C-Left> <C-w><C-h>
vnoremap <C-Right> <C-w><C-l>

" fat fingers
noremap <F1> <Esc>

inoremap     <C-X><C-@> <C-A>
" Emacs style mappings
inoremap          <C-A> <C-O>^
cnoremap          <C-A> <Home>
cnoremap     <C-X><C-A> <C-A>
" If at end of a line of spaces, delete back to the previous line.
" Otherwise, <Left>
inoremap <silent> <C-B> <C-R>=getline('.')=~'^\s*$'&&col('.')>strlen(getline('.'))?"0\<Lt>C-D>\<Lt>Esc>kJs":"\<Lt>Left>"<CR>
cnoremap          <C-B> <Left>
" If at end of line, decrease indent, else <Del>
inoremap <silent> <C-D> <C-R>=col('.')>strlen(getline('.'))?"\<Lt>C-D>":"\<Lt>Del>"<CR>
cnoremap          <C-D> <Del>
" If at end of line, fix indent, else <Right>
inoremap <silent> <C-F> <C-R>=col('.')>strlen(getline('.'))?"\<Lt>C-F>":"\<Lt>Right>"<CR>
inoremap          <C-E> <End>
cnoremap          <C-F> <Right>
noremap!          <M-a> <C-O>(
map!              <M-b> <S-Left>
noremap!          <M-d> <C-O>dw
noremap!          <M-e> <C-O>)
map!              <M-f> <S-Right>
noremap!          <M-h> <C-W>
noremap           <M-l> guiww
noremap           <M-u> gUiww
noremap!          <M-l> <Esc>guiw`]a
noremap!          <M-u> <Esc>gUiw`]a
noremap!          <M-{> <C-O>{
noremap!          <M-}> <C-O>}

cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><C-w>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><C-w>
cnoremap <C-g>  <C-c>

inoremap <c-u> <esc>viwUgi
nnoremap <c-u> viwU

nmap Q <NOP>


" Switching between active files in a buffer.
nnoremap <leader><leader> <c-^>

" CTags
noremap <leader>ct :!ctags --extra=+f -R *<CR>
noremap <C-\> :tnext<CR>

set tags+=gems.tags

nnoremap <CR> :nohlsearch<CR>/<BS>

noremap <silent> <leader>y :<C-u>silent '<,'>w !pbcopy<CR>

