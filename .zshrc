
# Source location
export DOTFILES_SRC=~/.ethan

# Navigate to this file
alias zshrc="nv $DOTFILES_SRC/.zshrc"
alias zshreload="source $DOTFILES_SRC/.zshrc"

####### Zsh things

source $DOTFILES_SRC/cli-extensions/prompt.zsh
setopt AUTO_CD
HISTFILE=$DOTFILES_SRC/.zsh_history

####### External terminal things
source $DOTFILES_SRC/kitty/*.zsh
source $DOTFILES_SRC/cli-extensions/*.zsh
source $DOTFILES_SRC/company/*.zsh

####### NVim things
alias nv='nvim'
alias vimrc='nv ~/.config/nvim/init.vim'

#alias ps='ps -ce -o pid,user,ni,command'

alias ls='ls -G'
# lists: size (w abbrev kb,mb), date modified (removed the year), and the file
lsa() {
    CLICOLOR_FORCE=1 ls -GoATh $1 | cut -c 26- | sed -E "s/ [0-9]{4} / /g" | awk NF
}

alias path="echo $PATH | tr ':' '\n'"

alias ds='rm ./.DS_Store'

alias size='du -hcs * | sort -hr'
alias size_hidden='du -hcs .[^.]* * | sort -hr'


######## extra CDs

# set PATH to the following in order to access xcode command line tools like clang etc.
alias xctoolspath='cd /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin'

alias derivedData='cd ~/Library/Developer/Xcode/DerivedData/'

alias interop='open ~/Documents/whiteboard/When\ people\ ask\ how\ to\ do\ this/408_building_faster_in_xcode.png'

######## iOS
alias podcache='cd ~/Library/Caches/Cocoapods/Pods/'
alias repocache='cd ~/.cocoapods/repos/'

alias buildtxt='cat ~/Desktop/build.txt'

######## Misc

alias kill-ui='killall -KILL SystemUIServer'
alias kill-audio='sudo launchctl stop com.apple.audio.coreaudiod && sudo launchctl start com.apple.audio.coreaudiod'
alias kill-dock='killall Dock'

google() {
  for term in $@ ; do
    search="$search%20$term"
  done
    
  open "http://www.google.com/search?q=$search"
  search=
}

# For best results, play heavy techno like the Blade club scene
alias hacker='find ~ | cut -d/ -f7-'


######## git

alias gitinfo='cat .git/config'
alias gitdiscard='git reset --hard HEAD'
alias merge='open -a Sublime\ Merge '

######## VSCode
alias tasks='visual ~/Documents/whiteboard/Tasks.md'
alias log='visual ~/Documents/whiteboard/Log.md'
alias whiteboard='visual ~/Documents/whiteboard'
alias visual='open -a Visual\ Studio\ Code\ -\ Insiders'

######## Xcode
alias workspace='open "$(find . -name *.xcworkspace)" -a Xcode'
alias project='open "$(find . -name *.xcodeproj)" -a Xcode'
alias sign_identities='security find-identity -v -p codesigning'
alias xcode='open -a Xcode'

######## Things Ethan didn't add

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
