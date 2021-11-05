#!/bin/bash

git submodule update --init --recursive
rm -rf ~/.oh-my-zsh
rm ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/adambujak/ohmyzsh/master/tools/install.sh)"
