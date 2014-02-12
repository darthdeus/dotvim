" This must be first, because it changes other options as a side effect.
set nocompatible

set shell=/bin/sh

" if $SHELL =~ 'fish'
"   set shell=/bin/sh
" end

runtime config/bundles.vim
runtime config/settings.vim
runtime config/keymap.vim

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

aug various_file_types
  au!
  " Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
  au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

  " md, markdown, and mk are markdown and define buffer-local preview
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

  " add json syntax highlighting
  au BufNewFile,BufRead *.json set filetype=javascript
  au BufNewFile,BufRead *.txt call s:setupWrapping()

  au BufNewFile,BufRead *.fish set filetype=fish
  au BufNewFile,BufRead *.ejs set filetype=html

  au BufNewFile,BufRead *.em set filetype=coffee

  au BufNewFile,BufRead *.thrift set filetype=thrift
aug END

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo
   " exec ":!fish -c 'rspec " . a:filename . "'"
   exec ":!bundle exec rspec " . a:filename
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
noremap <leader>t :call RunTestFile()<cr>
" Run only the example under the cursor
noremap <leader>T :call RunNearestTest()<cr>
" Run all test files
noremap <leader>a :call RunTests('spec')<cr>

" remove unnecessary whitespaces
noremap <leader>ws :%s/ *$//g<cr><c-o><cr>

set pastetoggle=<F5>
noremap <F6> :!rake<cr>

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

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

" Automatic completion of ) and } for a given (
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
" inoremap {{     {
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
" inoremap ((     (
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

set exrc
set secure
