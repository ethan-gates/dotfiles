alias kconf="nvim $DOTFILES_SRC/kitty/kitty.conf"

# Tells kitty to use the directory as the window title
precmd () {print -Pn "\e]0;%~\a"}

# Change the theme for kitty provided kitty-themes
function kittytheme() {
    THEME_PATH=$DOTFILES_SRC/kitty-themes/themes/$1.conf
    echo "Looking for $THEME_PATH"
    echo "\$1 = $1"
    if [[ -e $THEME_PATH ]]; then 
        rm $DOTFILES_SRC/kitty/theme.conf
        ln -s $THEME_PATH ~/.config/kitty/theme.conf
    else
        echo "$1 Theme not found"
    fi
}

function kittythemelist() {
    ls $DOTFILES_SRC/kitty-themes/themes
}
