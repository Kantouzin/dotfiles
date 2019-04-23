#!/usr/bin/env fish

set DOT_DIR "$HOME/dotfiles"

for file in .??*
    if test "$file" = ".git"
        continue
    end

    ln -sfnv $DOT_DIR/$file $HOME/$file
end

