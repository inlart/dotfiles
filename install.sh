#!/bin/sh

prompt_confirm() {
    default=${2-0}
    prompt_yn="[Y/n]"
    if [ "$default" -ne 0 ]; then
        prompt_yn="[y/N]"
    fi
    while true; do
        echo "${1:-Continue?} $prompt_yn: "
        read -r REPLY
        case $REPLY in
            [yY]) echo ; return 0 ;;
            [nN]) echo ; return 1 ;;
            *) return "${2-0}" ;;
        esac
    done
}

link_config() {
    ln -sf "$2" "$1"
}

copy_config() {
    cp -f "$2" "$1"
}

install() {
    repo_directory="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"
    install_path="$1/$3"
    install_directory=${install_path%/*}
    repo_path="$repo_directory/.config/$3"
    if [ -f "$install_path" ]; then
        prompt_confirm "$3 already exists. Replace?" 1 || return 1
    fi

    if [ ! -d "$install_directory" ]; then
        echo "Creating directory $install_directory"
        mkdir -p "$install_directory"
    fi
    $2 "$install_path" "$repo_path"
}

# get config dir
if [ -s "$XDG_CONFIG_HOME" ]; then
    config_dir=$XDG_CONFIG_HOME
elif [ -s "$HOME" ]; then
    config_dir=$HOME/.config
else
    echo "Could not find config directory"
    exit 1
fi

# select installation method
install_cmd="link_config"
prompt_confirm "Use symlinks instead of copies?" || install_cmd="copy_config"

# install
find .config ! -name "$(printf "*\n*")" -type f > tmp
while IFS= read <&3 -r file
do
    path=${file#.config/}
    install "$config_dir" "$install_cmd" "$path" || echo "Didn't install $path"
done 3< tmp
rm tmp

