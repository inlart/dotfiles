CURRENT_BG='NONE'
CURRENT_FG='black'

() {
	local LC_ALL="" LC_CTYPE="en_US.UTF-8"
	SEGMENT_SEPARATOR=$'\ue0b0'
}

prompt_segment() {
	local bg fg
	[[ -n $1 ]] && bg="%K{$1}" || bg="%k"
	[[ -n $2 ]] && fg="%B%F{$2}" || fg="%b%f"
	if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
		echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
	else
		echo -n "%{$bg%}%{$fg%} "
	fi
	CURRENT_BG=$1
	[[ -n $3 ]] && echo -n $3
}

prompt_status() {
	local bg
	bg='green'
	[[ $RETVAL -ne 0 ]] && bg='red'

	prompt_segment $bg $CURRENT_FG "λ"
}

prompt_dir() {
	local git_root=$PWD
	local prompt_short_dir
	while [[ $git_root != / && ! -e $git_root/.git ]]; do
		git_root=$git_root:h
	done
	if [[ $git_root = / ]]; then
		prompt_short_dir=%~
	else
		local parent=${git_root%\/*}
		prompt_short_dir=${PWD#$parent/}
	fi
	prompt_segment '' white $prompt_short_dir
}

prompt_git() {
	(( $+commands[git] )) || return
	if [[ "$(git config --get oh-my-zsh.hide-status 2>/dev/null)" = 1 ]]; then
		return
	fi
	prompt_segment '' cyan "$(git_prompt_info)"
}

prompt_end() {
	if [[ -n $CURRENT_BG ]]; then
		echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
	else
		echo -n "%{%k%}"
	fi
	echo -n "%{%b%f%} "
	CURRENT_BG=''
}

build_prompt() {
	RETVAL=$?
	prompt_status
	prompt_dir
	prompt_git
	prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt)'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}Δ%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""