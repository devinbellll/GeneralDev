#!/bin/bash

current_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

pushd "$current_path"

mkdir -p ~/.config/nvim

# copy nvim themes
cp -R lua ~/.config/nvim/
cp init.vim ~/.config/nvim

