#!/usr/bin/env bash

echo 'export ZDOTDIR=~/.config/zsh' > ~/.zshenv

[ ! -d ~/.config ] && mkdir ~/.config

ln -sf "$PWD/config/zsh" ~/.config/  
ln -sf "$PWD/config/nvim" ~/.config/
