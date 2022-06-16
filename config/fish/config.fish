# encoding
set -x LANG ja_JP.UTF-8
set -x LC_CTYPE ja_JP.UTF-8

# alias
alias vi="/usr/bin/vim"
if test /usr/bin/exa
    alias ls="exa -a"
end
if test /usr/bin/trash-put
    alias rm="trash-put"
end
alias glgg="git log --oneline --graph --decorate"
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias cp="cp -i"
alias mv="mv -i"
alias cdp="cd /mnt/d/Project"

# windows path
alias clip="/mnt/c/Windows/System32/clip.exe"

# powerline
set fish_function_path $fish_function_path "/usr/local/lib/python3.6/dist-packages/powerline/bindings/fish/"
powerline-setup

set -x DISPLAY localhost:0.0
set -x LIBGL_ALWAYS_INDIRECT 1

# golang
set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin
set PATH $GOPATH $GOBIN $PATH
