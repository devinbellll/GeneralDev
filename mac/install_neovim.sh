#!/bin/bash

DEFAULT_THEME="light"
THEME="${1:-$DEFAULT_THEME}"

pushd ~ > /dev/null
HOME_PATH=$(pwd)
popd > /dev/null

brew install nvim 
pip3 install pynvim

rm -rf ~/.config/nvim/ ~/.nvim

git submodule update --init --recursive

mkdir -p ~/.config/nvim
mkdir -p ~/.nvim

cp neovimrc_dark ~/.config/nvim/dark_nvim_theme.vim
cp neovimrc_light ~/.config/nvim/light_nvim_theme.vim


if [ $THEME == "dark" ]; then
  THEME_PATH=$(echo "~/.config/nvim/dark_nvim_theme.vim" | sed 's/\//\\\//g')
else 
  THEME_PATH=$(echo "~/.config/nvim/light_nvim_theme.vim" | sed 's/\//\\\//g')
fi

# copy neovimrc to proper place and set correct theme file
sed "s/MY_VIM_THEME_SOURCE/${THEME_PATH}/g" "neovimrc" > $HOME_PATH/.config/nvim/init.vim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
