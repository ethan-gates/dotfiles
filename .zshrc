
# Source location
export DOTFILES_SRC=~/.ethan

# Navigate to this file
alias zshrc="nv $DOTFILES_SRC/.zshrc"
alias zshreload="source $DOTFILES_SRC/.zshrc"

#### Zsh things
HISTFILE=$DOTFILES_SRC/.zsh_history

#### Maps .config to repo root (only for XDG compliant)
export XDG_CONFIG_HOME=$DOTFILES_SRC

#### External scripts
# Most functionality is loaded here
alias loaded_zshs="find $DOTFILES_SRC/shell-scripts -name \*.zsh"

for f in $DOTFILES_SRC/shell-scripts/*.zsh; do
    source $f
done

source $DOTFILES_SRC/company/*.zsh


#### Added by other tools (rvm etc)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
