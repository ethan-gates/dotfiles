
# For bazelizing before buying into custom gem distro
alias bepb='bundle exec pod bazelize'
alias bepbn='bundle exec pod bazelize --no-xcode-proj'

alias bepi='bundle exec pod install'
alias bi='bundle install'

# bazel commands
alias bb='bazel build'
alias br='bazel run'
alias bt='bazel test'

# xcode things
alias derived_data='cd ~/Library/Developer/Xcode/DerivedData'

# swift compiler building
export SCCACHE_CACHE_SIZE="50G"
