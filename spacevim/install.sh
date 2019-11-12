#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

if [ ! -d "$HOME/.SpaceVim.d" ]; then
    step 'Installing spacevim for neovim'
    curl -sLf https://spacevim.org/install.sh | bash -s -- install neovim
fi

if [ -x "/usr/local/bin/pip2" ]; then
    /usr/local/bin/pip2 install -U neovim
fi

if [ -x "/usr/local/bin/pip3" ]; then
    /usr/local/bin/pip3 install -U neovim
fi


if command -v pyenv 2>&1 > /dev/null; then
    PY_VERSION_MANAGER="pyenv"
elif command -v asdf 2>&1 > /dev/null; then
    PY_VERSION_MANAGER="asdf"
else
    exit
fi

if [ "$PY_VERSION_MANAGER" == "pyenv" ]; then
    eval "$(pyenv init -)"
    pythons=$(pyenv versions --bare)
elif [ "$PY_VERSION_MANAGER" == "asdf" ]; then
    source $(brew --prefix asdf)/asdf.sh
    pythons=$(asdf list python | grep -v 'No versions installed')
else
    exit
fi

for python in $pythons; do
    if [ "$PY_VERSION_MANAGER" == "pyenv" ]; then
        pyenv shell $python
        pyenv rehash
        pyenv exec pip install -U neovim
    else
        ASDF_PYTHON_VERSION=$python asdf reshim pip $python
        ASDF_PYTHON_VERSION=$python asdf exec pip install -U neovim
    fi
done
