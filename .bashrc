#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias s="sudo"
alias v="vim"
alias gv="gvim"
alias gclo="git clone"
alias ..="cd .."
alias ls='ls --color=auto'
PS1=' >>  '

## Ruby Gems
PATH="`ruby -e 'print Gem.user_dir'`/bin:$PATH"

## Bin
export PATH=$PATH:~/.bin

## Bundler
export GEM_HOME=$(ruby -e 'print Gem.user_dir')

## Jhbuild
#export PATH=$PATH:~/.local/bin

# Autocomplete using tab
if [ -f /etc/bash_completion ]; then
source /etc/bash_completion
complete -W "+%H:%M +%d.%m.%y_%H:%M" date
bind "set completion-ignore-case on"
fi

# Always use UTF8
export LANG=en_US.UTF-8

# History, ignore duplicates, append
export HISTSIZE="10000"
export HISTFILESIZE="10000"
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
shopt -s histappend

# Preserve environment when doing "sudo vim [..]"
function sudo() {
case $* in
vim* ) shift 1; command sudo -E vim "$@" ;;
* ) command sudo "$@" ;;
esac
}


