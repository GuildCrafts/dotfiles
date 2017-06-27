#!/bin/bash

export EDITOR='atom -w' # swap atom for subl if you use Sublime
export GIT_EDITOR='atom -w' # swap atom for subl if you use Sublime
export PATH="./node_modules/.bin:$PATH"
export NODE_ENV=development

# NVM - Node Version Manager
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"


# Aliases

# if you have hub installed
# alias git=hub

alias copy=pbcopy
alias paste=pbpaste

# common shortcuts
alias c='clear'
alias o='open'
alias e='atom' # swap atom for subl if you use Sublime

# reveal a file in the Finder.app
alias reveal='open -R'
