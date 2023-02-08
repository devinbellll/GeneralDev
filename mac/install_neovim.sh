#!/bin/bash

brew install nvim 
pip3 install pynvim

rm -rf ~/.config/nvim/ ~/.nvim

git submodule update --init --recursive

mkdir -p ~/.config/nvim
mkdir -p ~/.nvim
cp neovimrc_light ~/.config/nvim/init.vim
cp neovimrc_dark ~/.config/nvim/init_dark.vim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

git clone https://github.com/VundleVim/Vundle.vim.git ~/.nvim/bundle/Vundle

