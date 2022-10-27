
# Adding current directory to path
export PATH="$PATH:."

# Print path with newlines so easier to read
alias path="echo $PATH | tr ':' '\n'"

function choose() {
    PROGRAM_PATH=`which -a $1 | fzf`
    alias $1=$PROGRAM_PATH
    echo "Running \e[32m'alias $1=$PROGRAM_PATH'\e[0m"
}