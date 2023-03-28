#!/usr/bin/env bash
# A reference list of commands to remember to run when setting up a macbook. 
# Definitely not exhaustive because I dont remember everything I did.

echo 'ERROR: This script is not meant to be ran directly.'
exit 1

defaults write -g InitialKeyRepeat -int 10 # default minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1         # default minimum is 2 (30 ms)

echo 'export ZDOTDIR=~/.config/zsh' > ~/.zshenv
mkdir -p /usr/local/share/zsh/site-functions/

[ ! -d ~/.config ] && mkdir ~/.config

ln -sf "$PWD/zsh" ~/.config/ 
ln -sf "$PWD/nvim" ~/.config/
ln -sf "$PWD/xonsh" ~/.config/

