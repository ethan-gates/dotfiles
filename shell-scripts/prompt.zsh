setopt prompt_subst
setopt inc_append_history_time

prompt_status_code() {
    echo "%(?.%F{240}.%F{red}?)%f"
}

prompt_directory() {
    echo "%B%F{white}%1~%b%f"
}

prompt_git_branch() {
    BRANCH=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
    if [[ $BRANCH ]]; then
        echo "%F{white}(%F{63}$BRANCH%F{white})%f "
    fi
}

prompt_suffix() {
    echo "%B%F{white}$ %f%b"
}

export PROMPT='`prompt_status_code` `prompt_directory` `prompt_git_branch``prompt_suffix`'