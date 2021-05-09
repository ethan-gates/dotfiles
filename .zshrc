
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
source $DOTFILES_SRC/cli-extensions/gradle.zsh
source $DOTFILES_SRC/cli-extensions/fzf-extras.zsh

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
alias be='time bundle exec'
alias bef='time bundle exec fastlane'
alias bepi='time bundle exec pod install --verbose'
alias bepiq='bundle exec pod install'
alias bepu='time bundle exec pod update --verbose'
alias bi='time bundle install'
alias bu='time bundle update'

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

# Counting lines of files
alias count-swift='find . -name "*.swift" | xargs wc -l'
alias count-objc='find . -name "*.[hm]" | xargs wc -l'
alias count-em='find . -name "*.m" | xargs wc -l'
alias count-h='find . -name "*.h:" | xargs wc -l'

alias m_files='find . -path ./Pods -prune -o -name "*.m" -print'


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

######## Make Fan Quieter 

SymID=$(pgrep SymUIAgent)
#renice 20 $SymID

# In function to prevent password prompt on startup
function kill_bloat() {
  SymDaemon=$(pgrep SymDaemon)
  sudo renice 20 $SymDaemon

}


