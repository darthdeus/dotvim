" This must be first, because it changes other options as a side effect.
set nocompatible

set shell=sh

filetype off
set rtp+=~/.vim/bundle/vundle/
set rtp+=/usr/local/opt/go/libexec/misc/vim
call vundle#rc()

Bundle "vim-scripts/a.vim"
Bundle "gmarik/vundle"
Bundle "wikitopian/hardmode"
Bundle "benmills/vimux"
let g:VimuxOrientation = "h"

Bundle "rking/ag.vim"

Bundle "tomtom/tcomment_vim"
Bundle "tomtom/tlib_vim"
Bundle "godlygeek/tabular"
Bundle "pangloss/vim-javascript"

Bundle "wincent/Command-T"

Bundle "tpope/vim-bundler"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-eunuch"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-rake"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-markdown"

" Snippets
Bundle "SirVer/ultisnips"
Bundle "honza/vim-snippets"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories  = ["snips"]

function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "slim-template/vim-slim"
Bundle "kchmck/vim-coffee-script"
Bundle "scrooloose/nerdtree"

Bundle "krisajenkins/vim-projectlocal"
Bundle "AndrewRadev/switch.vim"
Bundle "eshock/vim-matchit"
Bundle "skwp/vim-rspec"
Bundle "mattn/gist-vim"
Bundle "mattn/webapi-vim"

Bundle "darthdeus/smartest.vim"
Bundle "kurko/autocoder.vim"
Bundle "ecomba/vim-ruby-refactoring"
Bundle "mattn/zencoding-vim"

Bundle "sjl/gundo.vim"
Bundle "othree/html5.vim"

Bundle "rhysd/vim-clang-format"
Bundle "kana/vim-operator-user"

Bundle "mattn/emmet-vim"
Bundle "dag/vim2hs"

" Bundle "scrooloose/syntastic"
" Bundle "Valloric/YouCompleteMe"
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist = ['*']

let g:haskell_conceal = 0
let g:haskell_quasi         = 1
let g:haskell_interpolation = 0
let g:haskell_regex         = 0
let g:haskell_jmacro        = 0
let g:haskell_shqq          = 0
let g:haskell_sql           = 0
let g:haskell_json          = 0
let g:haskell_xml           = 0
let g:hpaste_author = "darthdeus"

let g:syntastic_haskell_checkers = ['hdevtools']

Bundle "Shougo/vimproc.vim"

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++1y -stdlib=libc++'

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1

let g:syntastic_cpp_check_header = 0

" let g:syntastic_quiet_messages=1
let g:syntastic_mode_map = { "mode": "passive", "active_filetypes": ["haskell", "go", "cpp", "idris", "rust"] }

set foldlevelstart=200

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

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
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,node_modules,tmp,project/target,target,tags,CMakeFiles,bower_components,dist,_darcs,vcr,app/assets/images,*.dSYM,*.pyc

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
"
" inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" inoremap <s-tab> <c-n>

command! W :w

" Status bar
set laststatus=2

set winwidth=75

" Change the leader to ","
let mapleader=","

" Use modeline overrides
set modeline
set modelines=10

set t_Co=256
set bg=dark

let base16colorspace=256  " Access colors present in 256 colorspace

color base16-default

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Remember last location in file
aug last_location
  au!
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
aug END

" Save undo history
if has('persistent_undo')
  set undofile
  if !isdirectory(expand('~/.vimundo'))
    silent !mkdir ~/.vimundo > /dev/null 2>&1
  endif
  set undodir=~/.vimundo
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Show (partial) command in the status line
set showcmd

" Remove scrollbars
set guioptions-=L
set guioptions-=r
set guioptions-=T

if has("gui_running")
  " Automatically resize splits when resizing MacVim window
  autocmd VimResized * wincmd =

  set vb
  " color Tomorrow-Night
  set lines=40
  set columns=120
endif

" Highlight current line
set cursorline

set tags+=gems.tags

" Buffer resizing with arrow keys
nnoremap <Up> <C-w>5-
nnoremap <Down> <C-w>5+
nnoremap <Left> <C-w>5<
nnoremap <Right> <C-w>5>

nnoremap - :Switch<cr>

" Expand %% to directory path of current buffer
cnoremap %% <C-R>=expand('%:h').'/'<CR>
nnoremap <leader>e :call VimuxRunCommand("make")<cr>
nnoremap <leader>v :view %%

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
noremap <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
noremap <leader>gt :CommandTFlush<cr>\|:CommandT spec<cr>
noremap <leader>gk :CommandTFlush<cr>\|:CommandT app/assets/stylesheets<cr>
noremap <leader>gj :CommandTFlush<cr>\|:CommandT app/assets/javascripts<cr>

nnoremap <C-a> ^
nnoremap <C-e> $

nnoremap <leader>rap  :RAddParameter<cr>
nnoremap <leader>rcpc :RConvertPostConditional<cr>
nnoremap <leader>rel  :RExtractLet<cr>
vnoremap <leader>rec  :RExtractConstant<cr>
vnoremap <leader>relv :RExtractLocalVariable<cr>
nnoremap <leader>rit  :RInlineTemp<cr>
vnoremap <leader>rrlv :RRenameLocalVariable<cr>
vnoremap <leader>rriv :RRenameInstanceVariable<cr>
vnoremap <leader>rem  :RExtractMethod<cr>

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

" Disable accidental ex mode
nmap Q <NOP>

" Switching between active files in a buffer.
nnoremap <leader><leader> <c-^>

" CTags
noremap <leader>ct :!ctags --extra=+f -R *<CR>
noremap <C-\> :tnext<CR>

nnoremap <CR> :nohlsearch<CR>/<BS>

noremap <silent> <leader>y :<C-u>silent '<,'>w !pbcopy<CR>

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

aug various_file_types
  au!
  " Rakefile, Vagrantfile and Gemfile are Ruby
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,config.ru}    set ft=ruby

  " md, markdown, and mk are markdown and define buffer-local preview
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupWrapping()

  " add json syntax highlighting
  au BufNewFile,BufRead *.json set filetype=javascript
  au BufNewFile,BufRead *.txt call s:setupWrapping()

  au BufNewFile,BufRead *.fish set filetype=fish
  au BufNewFile,BufRead *.conf set filetype=conf
aug END

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Run this file
noremap <leader>t :call RunTestFile()<cr>
" Run only the example under the cursor
noremap <leader>T :call RunNearestTest()<cr>
" Run all test files
noremap <leader>a :!zeus rspec spec<cr>

" remove unnecessary whitespaces
noremap <leader>ws :%s/ *$//g<cr><c-o><cr>

set pastetoggle=<F5>
set mouse=a

autocmd FileType c,cpp,objc nnoremap <buffer><C-e> :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><C-e> :ClangFormat<CR>

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

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

" Automatic completion of ) and } for a given (
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

set exrc
set secure
