#!/bin/bash

DOTFILES_PATH=~/.dotfiles
BASH_SRC_PATH=$DOTFILES_PATH/bash

. "$BASH_SRC_PATH"/.aliases

# System Specific
if [[ ! "$SSH_TTY" && "$OSTYPE" =~ ^darwin ]]; then
	. "$BASH_SRC_PATH"/.osx
fi


# edit this folder
alias dot="cd ~/.dotfiles"

# reload
alias rl="source ~/.bashrc; echo '~/.bashrc reloaded.'"