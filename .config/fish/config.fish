# encoding
set -x LANG ja_JP.UTF-8
set -x LC_CTYPE ja_JP.UTF-8

# alias
alias vi="/usr/bin/vim"
alias ls="ls -a --color"
if test /usr/bin/trash-put
alias rm="trash-put"
end

