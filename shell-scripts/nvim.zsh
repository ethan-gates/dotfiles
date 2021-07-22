
# For neovim commands

nv () {
  if [[ -e $1 ]]; then 
    nvim $1
  elif [[ -f 'session.vim' ]]; then
    nvim -S 'session.vim'
  fi
}
alias vimrc='nv ~/.ethan/nvim/init.vim'


alias vimplugs='cd `find ~/.local/share/nvim/plugged -mindepth 1 -maxdepth 1 | fzf --reverse`; nv .; cd -'
