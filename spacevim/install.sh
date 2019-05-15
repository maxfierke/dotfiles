#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

if [ ! -e "$HOME/.SpaceVim.d" ]; then
    step 'Installing spacevim for neovim'
    curl -sLf https://spacevim.org/install.sh | bash -s -- install neovim
fi

pip2 install -U neovim
pip3 install -U neovim
