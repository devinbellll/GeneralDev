#!/bin/bash

current_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

pushd "$current_path"

# copy ohmyzsh themes
cp themes/half-life-rose-pine.zsh-theme ~/.oh-my-zsh/themes

