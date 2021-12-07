#!/bin/bash

rm -rf ~/.tmux ~/.tmux.conf

cp .tmux.conf ~

cat light_tmux_theme >> ~/.tmux.conf
