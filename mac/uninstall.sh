#!/bin/bash

brew uninstall universal-ctags
brew uninstall fzf
brew uninstall the_silver_searcher
brew uninstall tmux
brew uninstall nvim 

pip3 uninstall pynvim

rm -rf ~/.local/share/nvim/
rm -rf ~/venv
rm -rf ~/.nvim
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim

rm ~/.gitignore
rm ~/.gitconfig

rm ~/.zprofile
rm ~/.zshrc
rm -rf ~/.oh-my-zsh

rm ~/.tmux.conf
