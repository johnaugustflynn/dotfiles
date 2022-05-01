#!/usr/bin/env bash

[ ! -d ~/.config ] && mkdir ~/.config
cp -R .dotfiles ~
cp -R .config/nvim ~/.config

if [ -f ~/.bash_profile ]
then
	cat .bash_profile >> ~/.bash_profile
else
	cp .bash_profile ~
fi

