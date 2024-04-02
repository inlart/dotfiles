# update path
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# oh-my-zsh installation
export ZSH=~/.config/oh-my-zsh

# set default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# case insensitive completion
CASE_SENSITIVE="false"

# disable the auto update
DISABLE_AUTO_UPDATE="true"

# disable dirty check for untracked files
DISABLE_UNTRACKED_FILES_DIRTY="true"

# date format in history
HIST_STAMPS="dd.mm.yyyy"

# don't remove spaces before "&" and "|"
ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;'

# used plugins
plugins=(
    git
    archlinux
    colored-man-pages
    fzf
    z
    catimg
    wd
    encode64
    starship
    ssh-agent
)

source $ZSH/oh-my-zsh.sh

# source aliases
if [ -f ~/.aliasrc ]; then
    source ~/.aliasrc
fi

LC_ALL=en_US.UTF-8

bindkey "^U" backward-kill-line

