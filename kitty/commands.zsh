alias kconf='nvim ~/.ethan/kitty/kitty.conf'

# Tells kitty to use the directory as the window title
precmd () {print -Pn "\e]0;%~\a"}

# Change the theme for kitty provided kitty-themes
function kittytheme() {
    echo "Looking for ~/.ethan/kitty-themes/themes/$1.conf"
    echo "\$1 = $1"
    if [[ -e ~/.ethan/kitty/kitty-themes/themes/$1.conf ]]; then 
        rm  ~/.ethan/kitty/theme.conf
	ln -s ~/.ethan/kitty/kitty-themes/themes/$1.conf ~/.ethan/kitty/theme.conf
    else
	echo "$1 Theme not found"
    fi
}

function kittythemelist() {
    ls ~/.ethan/kitty/kitty-themes/themes
}
