# For dealing with OS things usually daemon restarts

alias kill-ui='killall -KILL SystemUIServer'
alias kill-audio='sudo launchctl stop com.apple.audio.coreaudiod && sudo launchctl start com.apple.audio.coreaudiod'
alias kill-dock='killall Dock'


