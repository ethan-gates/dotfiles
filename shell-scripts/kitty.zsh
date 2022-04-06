
# For kitty customization

# Edit my conf file
alias kconf="nvim $DOTFILES_SRC/kitty/custom.conf"

# Change themes
alias theme='kitty +kitten themes'

# Add my custom conf to the default created one if it's not already there
# This is a manual thing if bootstrap failed, should only need once
function kitty_bind_custom_conf() {
    CONF=~/.config/kitty/kitty.conf
    INCLUDE="include $DOTFILES_SRC/kitty/custom.conf"
    if [[ ! -f $CONF ]]; then
        echo ~/.config/kitty/kitty.conf does not exist, press \`cmd+,\` to create it
        return
    fi

    echo Adding $INCLUDE to $CONF
    if [[ -z `cat $CONF | grep $INCLUDE` ]]; then
        echo $INCLUDE >> $CONF
    fi
}

# Tells kitty to use the directory as the window title
precmd () {print -Pn "\e]0;%c\a"}

