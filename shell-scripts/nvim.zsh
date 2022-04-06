
# For neovim commands

nv () {
  if [[ -e $1 ]]; then 
    nvim $1 --startuptime /tmp/nvim-startuptime
  elif [[ -f 'session.vim' ]]; then
    nvim -S 'session.vim' --startuptime /tmp/nvim-startuptime
  fi
}
alias vimrc='nv ~/.ethan/nvim/init.vim'
alias vimlua='nv ~/.ethan/nvim/init.lua' 

alias vimplugs='cd `find ~/.local/share/nvim/plugged -mindepth 1 -maxdepth 1 | fzf --reverse`; nv .; cd -'
