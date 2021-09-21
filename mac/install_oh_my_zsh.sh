#!/bin/bash

git submodule update --init --recursive
cp -R .oh-my-zsh ~
cp .zshrc ~
