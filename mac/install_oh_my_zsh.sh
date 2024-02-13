#!/bin/bash

git submodule update --init --recursive
rm -rf ~/.oh-my-zsh
rm ~/.zshrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

cp ./half-life-mod-light.zsh-theme ~/.oh-my-zsh/themes/
cp ./half-life-mod-dark.zsh-theme ~/.oh-my-zsh/themes/
