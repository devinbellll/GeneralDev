#!/bin/bash

current_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

pushd "$current_path"

# copy ohmyzsh themes
cp themes/half-life-mod-dark.zsh-theme ~/.oh-my-zsh/themes
cp themes/half-life-mod-light.zsh-theme ~/.oh-my-zsh/themes

# copy nvim themes
cp themes/neovimrc_dark ~/.config/nvim/dark_nvim_theme.vim
cp themes/neovimrc_light ~/.config/nvim/light_nvim_theme.vim

# append tmux theme to existing tmux
cat themes/light_tmux_theme >> ~/.tmux.conf
tmux source-file ~/.tmux.conf
