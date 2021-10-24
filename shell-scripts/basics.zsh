# For alias's and functions that help with normal builtin command things

#alias ps='ps -ce -o pid,user,ni,command'

alias ls='ls -G'
# lists: size (w abbrev kb,mb), date modified (removed the year), and the file
lsa() {
    CLICOLOR_FORCE=1 ls -GoATh $1 | cut -c 26- | sed -E "s/ [0-9]{4} / /g" | awk NF
}

alias env='env | sort'

alias path="echo $PATH | tr ':' '\n'"

alias ds='rm ./.DS_Store'

alias size='du -hcs * | sort -hr'
alias size_hidden='du -hcs .[^.]* * | sort -hr'
