#!/bin/bash

rm -rf ~/.vim ~/.vimrc

git submodule update --init --recursive
cp -R .vim ~
cp .vimrc ~

git clone git://github.com/ajh17/VimCompletesMe.git ~/.vim/pack/vendor/start/VimCompletesMe
git clone https://github.com/qpkorr/vim-renamer ~/.vim/bundle/vim-renamer

