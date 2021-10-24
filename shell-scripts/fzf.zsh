
FZF_IGNORES=(
    '-E vendor/'
    '-E .git'
    '-E build/'
)

export FZF_DEFAULT_COMMAND="fd --no-ignore --hidden $FZF_IGNORES[@]"
export FZF_DEFAULT_OPTS="--ansi --reverse"
# Some functions to help with common fzf pipes etc

# fzf |> nvim
function ff() {
    if [[ -n "$1" ]]; then
        echo "ff in $1"
        fzf-find nvim
    fi
    fzf-find nvim
}

# fzf |> bat
function ffb() {
    fzf-find bat
}

# fzf |> cd
function ffd () {
    DIR=`fd -HI --color always -t d | fzf --reverse --ansi --preview-window 'right:50%' --preview="CLICOLOR_FORCE=1 ls -G {}"`
    if [[ -e $DIR ]]; then
        cd $DIR
    fi
}

# fzf
function fzf-find() {
    FILE=`fzf --reverse --preview-window 'right:60%' --preview="bat --color=always {}"`
    if [[ -e $FILE ]]; then
        $1 $FILE
        unset FILE
    fi
}
