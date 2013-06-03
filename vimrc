" This must be first, because it changes other options as a side effect.
set nocompatible

set shell=/bin/sh

filetype off
set rtp+=~/.vim/bundle/vundle/
set rtp+=/usr/local/opt/go/misc/vim
call vundle#rc()

Bundle "gmarik/vundle"
Bundle "wikitopian/hardmode"
Bundle "benmills/vimux"
let g:VimuxOrientation = "h"

Bundle "mileszs/ack.vim"
Bundle "pangloss/vim-javascript"
Bundle "tomtom/tcomment_vim"
Bundle "tomtom/tlib_vim"
Bundle "godlygeek/tabular"
Bundle "pangloss/vim-javascript"
Bundle "jimenezrick/vimerl"
Bundle "elixir-lang/vim-elixir"
Bundle "derekwyatt/vim-scala"
Bundle "rodjek/vim-puppet"
Bundle "darthdeus/vim-emblem"

Bundle "tpope/vim-bundler"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-eunuch"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-rake"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-markdown"

Bundle "darthdeus/snipmate-snippets"
Bundle "garbas/vim-snipmate"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "bbommarito/vim-slim"
Bundle "kchmck/vim-coffee-script"
Bundle "scrooloose/nerdtree"

Bundle "krisajenkins/vim-projectlocal"
Bundle "wincent/Command-T"
Bundle "AndrewRadev/switch.vim"
Bundle "tsaleh/vim-matchit"
Bundle "skwp/vim-rspec"
Bundle "mattn/gist-vim"
Bundle "mattn/webapi-vim"

Bundle "mattn/zencoding-vim"
Bundle "nono/vim-handlebars"
Bundle "aliva/vim-fish"

Bundle "sjl/gundo.vim"
Bundle "othree/html5.vim"
Bundle "ZoomWin"

filetype plugin indent on

" Include user's local pre .vimrc config
if filereadable(expand("~/.vimrc.pre"))
  source ~/.vimrc.pre
endif

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

" Remember more commands and search history
set history=1000

set number
set ruler
syntax on

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" Note that the dot is a unicode character
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" Make tab completion for files/buffers act like bash
set wildmenu

set laststatus=0

" TODO - how does this differ from "longest,list" only?
" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,node_modules,tmp,project/target,target,tags

" TODO - what is the default behavior?
" Remap the tab key to do autocompletion or indentation depending on the
" context (from http://www.vim.org/tips/tip.php?tip_id=102)
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<tab>"
"     else
"         return "\<c-p>"
"     endif
" endfunction

" inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" inoremap <s-tab> <c-n>

command! W :w

" Status bar
set laststatus=2

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
" set noequalalways

set winwidth=100
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

" Change the leader to ","
let mapleader=","

" Switching between active files in a buffer.
nnoremap <leader><leader> <c-^>

" CTags
noremap <leader>ct :!ctags --extra=+f -R *<CR>
noremap <C-\> :tnext<CR>

nnoremap <CR> :nohlsearch<CR>/<BS>

noremap <silent> <leader>y :<C-u>silent '<,'>w !pbcopy<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Save undo history
if has('persistent_undo')
  set undofile
  if !isdirectory(expand('~/.vimundo'))
    silent !mkdir ~/.vimundo > /dev/null 2>&1
  endif
  set undodir=~/.vimundo
endif

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.txt call s:setupWrapping()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

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

inoremap <c-u> <esc>viwUgi
nnoremap <c-u> viwU

nmap Q <NOP>

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

" Use modeline overrides
set modeline
set modelines=10

color base16-default
set bg=dark

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Show (partial) command in the status line
set showcmd

" Remove scrollbars
set guioptions-=L
set guioptions-=r

set guifont=Menlo:h12

if has("gui_running")
  " Automatically resize splits when resizing MacVim window
  autocmd VimResized * wincmd =

  " GRB: set window size"
  :set lines=60
  :set columns=140
endif

" Highlight current line
set cursorline

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo
   exec ":!fish -c 'rspec " . a:filename . "'"
   " exec ":!bundle exec rspec " . a:filename
   " exec ":!./script/test " . a:filename
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_spec_file = match(expand("%"), '_spec.rb$') != -1
    if in_spec_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

" Run this file
map <leader>t :call RunTestFile()<cr>
" Run only the example under the cursor
map <leader>T :call RunNearestTest()<cr>
" Run all test files
map <leader>a :call RunTests('spec')<cr>

" remove unnecessary whitespaces
map <leader>ws :%s/ *$//g<cr><c-o><cr>

map <F5> :!rake<cr>

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" TODO - pull request this into the main fish.vim repo
au BufNewFile,BufRead *.fish set filetype=fish
au BufNewFile,BufRead *.ejs set filetype=html

nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" Surround with {% raw %}content{% endraw %}
nnoremap <Leader>swr c2f}{% raw %}<ESC>pa{% endraw %}<ESC>

if has("user_commands")
  command! -bang -nargs=? -complete=file E e<bang> <args>
  command! -bang -nargs=? -complete=file W w<bang> <args>
  command! -bang -nargs=? -complete=file Wq wq<bang> <args>
  command! -bang -nargs=? -complete=file WQ wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
endif

set exrc
set secure
