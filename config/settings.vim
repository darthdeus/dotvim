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

" Relative line numbers
" set rnu

set laststatus=0

" TODO - how does this differ from "longest,list" only?
" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,node_modules,tmp,project/target,target,tags,CMakeFiles,bower_components,dist,_darcs

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

" Use modeline overrides
set modeline
set modelines=10

set t_Co=256
" set bg=dark
set bg=light

" if has("gui_running")
"   color tomorrow
"   color tomorrow-night-eighties
" else
"   color base16-default
" end

color Tomorrow-Night-Bright
" color base16-default


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

set guifont=Monaco\ for\ Powerline:h14

if has("gui_running")
  " Automatically resize splits when resizing MacVim window
  autocmd VimResized * wincmd =

  set lines=40
  set columns=120
endif

" Highlight current line
set cursorline

set tags+=gems.tags
