#!/bin/bash

rm -rf ~/.vim ~/.vimrc

git submodule update --init --recursive
cp -R .vim ~
cp light_vimrc ~/.vimrc

git clone https://github.com/junegunn/fzf ~/.vim/bundle/fzf
git clone https://github.com/ajh17/VimCompletesMe.git ~/.vim/pack/vendor/start/VimCompletesMe
git clone https://github.com/qpkorr/vim-renamer ~/.vim/bundle/vim-renamer
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes.git ~/.vim/bundle/vim-airline-themes
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
