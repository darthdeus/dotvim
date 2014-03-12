filetype off
set rtp+=~/.vim/bundle/vundle/
set rtp+=/usr/local/opt/go/libexec/misc/vim
call vundle#rc()

Bundle "gmarik/vundle"
Bundle "wikitopian/hardmode"
Bundle "benmills/vimux"
let g:VimuxOrientation = "h"

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

Bundle "wincent/Command-T"
" Bundle "kien/ctrlp.vim"

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
Bundle "slim-template/vim-slim"
Bundle "kchmck/vim-coffee-script"
Bundle "scrooloose/nerdtree"

Bundle "krisajenkins/vim-projectlocal"
Bundle "AndrewRadev/switch.vim"
Bundle "eshock/vim-matchit"
Bundle "skwp/vim-rspec"
Bundle "mattn/gist-vim"
Bundle "mattn/webapi-vim"

Bundle "mattn/zencoding-vim"
Bundle "nono/vim-handlebars"
Bundle "aliva/vim-fish"

Bundle "sjl/gundo.vim"
Bundle "othree/html5.vim"
Bundle "ZoomWin"

let g:clang_format#code_style="llvm"
Bundle "rhysd/vim-clang-format"
Bundle "kana/vim-operator-user"

Bundle "wting/rust.vim"

Bundle "mattn/emmet-vim"

Bundle "scrooloose/syntastic"

Bundle "dag/vim2hs"
let g:haskell_conceal = 0
let g:haskell_quasi         = 0
let g:haskell_interpolation = 0
let g:haskell_regex         = 0
let g:haskell_jmacro        = 0
let g:haskell_shqq          = 0
let g:haskell_sql           = 0
let g:haskell_json          = 0
let g:haskell_xml           = 0
let g:hpaste_author = "darthdeus"

Bundle "bitc/vim-hdevtools"
let g:hdevtools_options="-g -fdefer-type-errors"
let g:syntastic_haskell_checkers = ['hdevtools', 'hlint']
" let g:haddock_browser="/usr/bin/firefox"

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages=1


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

let g:syntastic_mode_map = { "mode": "passive", "active_filetypes": ["haskell", "go"] }
