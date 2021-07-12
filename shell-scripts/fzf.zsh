
export FZF_DEFAULT_COMMAND='fd --no-ignore --hidden --exclude ".git"'
# Some functions to help with common fzf pipes etc

# fzf |> nvim
function ff() {
    fzf-find nvim
}

# fzf |> bat
function ffb() {
    fzf-find bat
}

# fzf
function fzf-find() {
    FILE=`fzf --reverse --preview-window 'right:60%' --preview="bat --color=always {}"`
    if [[ -e $FILE ]]; then
        $1 $FILE
        unset FILE
    fi
}
export BAT_THEME='zenburn'
