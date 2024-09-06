#!/bin/bash
source ./function.sh

check_distribution_name
install_zsh

dotfiles=(.vimrc .zshrc .tmux.conf)

for file in "${dotfiles[@]}";do
  ln -svf ~/dotfiles/$file ~/
done
