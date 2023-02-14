#!/bin/bash

brew install tmux

rm -rf ~/.tmux ~/.tmux.conf

cp .tmux.conf ~

cat light_tmux_theme >> ~/.tmux.conf
tmux source-file ~/.tmux.conf
