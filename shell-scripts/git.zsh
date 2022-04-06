#### git extras

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gam='git commit --amend'
alias gitinfo='cat .git/config'
alias gitdiscard='git reset --hard HEAD'

dif() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}
