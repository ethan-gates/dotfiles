
# Adding current directory to path
export PATH="$PATH:."

# Print path with newlines so easier to read
alias path="echo $PATH | tr ':' '\n'"

# Add rust tools to path if installed via rustup/cargo
if [[ -d ~/.cargo/bin ]]; then
    export PATH=$PATH:~/.cargo/bin
fi


