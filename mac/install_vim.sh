#!/bin/bash

rm -rf ~/.vim ~/.vimrc

git submodule update --init --recursive
cp -R .vim ~
cp light_vimrc ~/.vimrc

git clone git://github.com/ajh17/VimCompletesMe.git ~/.vim/pack/vendor/start/VimCompletesMe
git clone https://github.com/qpkorr/vim-renamer ~/.vim/bundle/vim-renamer
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes.git ~/.vim/bundle/vim-airline-themes
