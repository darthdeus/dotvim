#!/bin/bash
git submodule init
git submodule update
ln -s ~/.vim/vimrc  ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd bundle/command-t/ruby/command-t
ruby extconf.rb
make
