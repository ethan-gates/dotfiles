
# Source location
export DOTFILES_SRC=~/.ethan
export REPOS=~/Documents/code
export FUN_REPOS=~/Documents/fun-code

# Navigate to this file
alias zshrc="nv $DOTFILES_SRC/.zshrc"
alias zshreload="source $DOTFILES_SRC/.zshrc"
alias dotfiles="visual $DOTFILES_SRC"

# Locates hist files here instead of polluting home dir
HISTFILE=$DOTFILES_SRC/.zsh_history

#### External scripts
# Most functionality is loaded here
for file in `find $DOTFILES_SRC -name \*.zsh`; do
    source $file
done
# Open one of the loaded zsh scripts
loaded_zshs () {
    FILE=`fd \.zsh$ $DOTFILES_SRC --no-ignore --color always | fzf --reverse --ansi`
    if [[ -n "$FILE" ]]; then
        nv $FILE
    fi
}

#### Added by other tools (rvm etc)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
