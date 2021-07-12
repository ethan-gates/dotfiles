# For things nearby to mac apps

#### Firefox
google() {
  for term in $@ ; do
    search="$search%20$term"
  done
    
  open "http://www.google.com/search?q=$search"
  search=
}


##### Sublime Merge
alias merge='open -a Sublime\ Merge '

##### VSCode
alias visual='open -a Visual\ Studio\ Code\ -\ Insiders'

##### Xcode
alias workspace='open "$(find . -name *.xcworkspace)" -a Xcode'
alias project='open "$(find . -name *.xcodeproj)" -a Xcode'
alias sign_identities='security find-identity -v -p codesigning'
alias xcode='open -a Xcode'
