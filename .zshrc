# update path
export PATH=$HOME/bin:/usr/local/bin:$PATH

# oh-my-zsh installation
export ZSH="/home/martin/.oh-my-zsh"

# theme
ZSH_THEME="lambda"

# case sensitive completion
CASE_SENSITIVE="true"

# disable the auto update
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# disable dirty check for untracked files
DISABLE_UNTRACKED_FILES_DIRTY="true"

# date format in history
HIST_STAMPS="dd.mm.yyyy"

# used plugins
plugins=(
	git
	archlinux
	colored-man-pages
	fzf
)

source $ZSH/oh-my-zsh.sh

# source aliases
if [ -f ~/.aliasrc ]; then
	source ~/.aliasrc
fi

LC_ALL=en_US.UTF-8
