#!/bin/bash

pushd ~ > /dev/null
HOME_PATH=$(pwd)
popd > /dev/null

OH_MY_ZSH_PATH=$HOME_PATH/.oh-my-zsh
NEW_PATH=$(echo $OH_MY_ZSH_PATH | sed 's/\//\\\//g')

sed "s/MY_PATH_TO_OH_MY_ZSH/${NEW_PATH}/g" ".zshrc" > $HOME_PATH/.zshrc
