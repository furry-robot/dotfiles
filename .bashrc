#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Prompt
_PROMPT() {
    _EXIT_STATUS=$?
    [ $_EXIT_STATUS != 0 ] && _EXIT_STATUS_STR="\[\033[1;30m\][\[\033[1;31m\]$_EXIT_STATUS\[\033[1;30m\]] "
    PS1="\033[1;30m\]» \[\e[0;33m\]furry\033[1;30m\]╺─╸$_EXIT_STATUS_STR\[\033[1;30m\][\[\033[0m\]\W\[\033[1;30m\]]\[\033[1;34m\];\[\033[0m\] "
    unset _EXIT_STATUS_STR
}

PROMPT_COMMAND=_PROMPT

# Aliases
source ~/.bash_alias
# Bin
export PATH=$PATH:~/.bin
# Bundler
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
# Composer
export PATH="$PATH:~/.composer/vendor/bin"
# Functions
source ~/.bash_function
# Go
export GOPATH=~/.go
export PATH="$PATH:$GOPATH/bin"
# Hub alias
eval "$(hub alias -s)"
# Ruby Gems
PATH="`ruby -e 'print Gem.user_dir'`/bin:$PATH"

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
