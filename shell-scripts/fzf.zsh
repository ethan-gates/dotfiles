
FZF_IGNORES=(
    '-E vendor/'
    '-E .git'
    '-E build/'
)

export FZF_DEFAULT_COMMAND="fd --no-ignore --hidden $FZF_IGNORES[@]"
export FZF_DEFAULT_OPTS="--ansi --reverse"
# Some functions to help with common fzf pipes etc


# fzf |> cd repos only
function fr() {
    REPO=`find $REPOS $FUN_REPOS -type d -exec test -e '{}/.git' ';' -print -prune | fzf`
    if [[ -d $REPO ]]; then
    	cd $REPO
    fi
}


# fzf |> vscode
function fv() {
    REPO=`find $REPOS $FUN_REPOS -type d -exec test -e '{}/.git' ';' -print -prune | fzf`
    if [[ -d $REPO ]]; then
        visual $REPO
    fi
}

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


fpkill() {
	pid=$(ps -e | fzf | xargs | cut -d" " -f1)
	echo "Kill process $pid?"
	ps $pid -o comm
	read -q "CHOICE?[y/n]:"
	if [[ $CHOICE == "y" ]]; then
		pkill $pid
		echo "\nKilled $pid"
	else
		echo "\naborted pkill"
	fi
}
