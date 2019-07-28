#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

if [ ! -e "$HOME/.SpaceVim.d" ]; then
    step 'Installing spacevim for neovim'
    curl -sLf https://spacevim.org/install.sh | bash -s -- install neovim
fi

eval "$(pyenv init -)"

if [ -x "/usr/local/bin/pip2" ]; then
    /usr/local/bin/pip2 install -U neovim
fi

if [ -x "/usr/local/bin/pip3" ]; then
    /usr/local/bin/pip3 install -U neovim
fi

pythons=$(pyenv versions --bare)

for python in $pythons; do
    pyenv shell $python
    pyenv rehash
    pyenv exec pip install -U neovim
done
