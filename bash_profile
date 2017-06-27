#!/bin/bash

# source your .bashrc file first
test -f ~/.bashrc && source ~/.bashrc

# Turns the Meta Key on
set meta-flag on
set input-meta on
set output-meta on
set convert-meta off
shift;shift; # I have no idea why set seems to append it args to $*, weird.

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1
# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
shopt -s cmdhist
shopt -s histappend # this ensures history is written
shopt -s lithist

bind "set completion-ignore-case on" # ignore care on tab completion in bash
bind 'set match-hidden-files off' # doesnt tab complete hidden files like .svn files


# this is for npm
export PKG_CONFIG_PATH=/usr/X11/lib/pkgconfig



export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
test -f "$(brew --prefix)/etc/bash_completion" && source "$(brew --prefix)/etc/bash_completion"


## declare an array possible paths to completion scripts you want to try sourcing
declare -a completions=(
  "$(brew --prefix)/etc/bash_completion.d/git-completion.bash"
  "$(brew --prefix)/etc/bash_completion.d/git-prompt.sh"
  "$(brew --prefix)/etc/bash_completion.d/docker"
  "$(brew --prefix)/etc/bash_completion.d/docker-compose"
  "$(brew --prefix)/etc/bash_completion.d/docker-machine-prompt.bash"
  "$(brew --prefix)/etc/bash_completion.d/docker-machine-wrapper.bash"
  "$(brew --prefix)/etc/bash_completion.d/docker-machine.bash"
  "$(brew --prefix)/etc/bash_completion.d/npm"
  "${HOME}/.iterm2_shell_integration.bash"
)

## now loop through the above array
for completion in "${completions[@]}"; do
  ## if the file exists, source it
  test -f "${completion}" && source "${completion}"
done


# Bash Prompt
export PROMPT_COLOR=34
export PS1=' \[\033[4;1;${PROMPT_COLOR}m\]\w\[\033[0m\]$(unalias git; __git_ps1 " $(git config --get user.email) (%s)") \n$ '
