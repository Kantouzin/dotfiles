# encoding
set -x LANG ja_JP.UTF-8
set -x LC_CTYPE ja_JP.UTF-8

# alias
alias vi="/usr/bin/vim"
alias ls="ls --all --color --classify"
if test /usr/bin/trash-put
    alias rm="trash-put"
end
alias glgg="git log --oneline --graph --decorate"
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias cp="cp -i"
alias mv="mv -i"

# powerline
set fish_function_path $fish_function_path "/usr/local/lib/python3.6/dist-packages/powerline/bindings/fish/"
powerline-setup
