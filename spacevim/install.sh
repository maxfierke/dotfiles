#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

if [ ! -e "$HOME/.SpaceVim.d" ]; then
    curl -sLf https://spacevim.org/install.sh | bash -s -- install neovim
fi
