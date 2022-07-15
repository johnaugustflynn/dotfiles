#!/usr/bin/env bash

echo 'export ZDOTDIR=~/.config/zsh' > ~/.zshenv
mkdir -p /usr/local/share/zsh/site-functions/

[ ! -d ~/.config ] && mkdir ~/.config

ln -sf "$PWD/config/zsh" ~/.config/  
ln -sf "$PWD/config/nvim" ~/.config/

