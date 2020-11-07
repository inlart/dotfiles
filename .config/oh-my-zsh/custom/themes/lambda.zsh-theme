prompt_segment() {
    local fg
    [[ -n $1 ]] && fg="%B%F{$1}" || fg="%b%f"
    echo -n "%{$fg%}"
    [[ -n $2 ]] && echo -n $2
}

prompt_status() {
    local fg='white'
    local text='λ'
    [[ $RETVAL -ne 0 ]] && {
        fg='red'
        text="$text.$RETVAL"
    }

    prompt_segment $fg $text
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
    prompt_segment blue " $prompt_short_dir"
}

prompt_git() {
    (( $+commands[git] )) || return
    if [[ "$(git config --get oh-my-zsh.hide-status 2>/dev/null)" = 1 ]]; then
        return
    fi
    GIT_PROMPT=$(git_prompt_info)
    [[ -n $GIT_PROMPT ]] && prompt_segment white " $(git_prompt_info)"
}

prompt_end() {
    echo -n "%{%b%f%} "
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
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{cyan}+%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""

