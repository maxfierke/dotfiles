#!/bin/bash

set -eo pipefail
source "$DOTFILES_ROOT"/util/common.sh

# Deprecated: no more installs for you!
# if [ ! -d "$HOME/.SpaceVim.d" ]; then
#     step 'Installing spacevim for neovim'
#     curl -sLf https://spacevim.org/install.sh | bash -s -- --install neovim
#     step_ok 'Installed'
# fi

if [ -x "/usr/local/bin/pip3" ]; then
    /usr/local/bin/pip3 install -U pynvim
fi


if command -v pyenv > /dev/null 2>&1; then
    PY_VERSION_MANAGER="pyenv"
elif command -v asdf > /dev/null 2>&1; then
    PY_VERSION_MANAGER="asdf"
else
    exit
fi

if [ "$PY_VERSION_MANAGER" == "pyenv" ]; then
    eval "$(pyenv init -)"
    pythons=$(pyenv versions --bare)
elif [ "$PY_VERSION_MANAGER" == "asdf" ]; then
    source "$(brew --prefix asdf)/asdf.sh"
    pythons=$(asdf list python | grep -v 'No versions installed')
else
    exit
fi

for python in $pythons; do
    if [ "$PY_VERSION_MANAGER" == "pyenv" ]; then
        pyenv shell "$python"
        pyenv rehash
        pyenv exec pip install -U pynvim
    else
        ASDF_PYTHON_VERSION=$python asdf reshim pip "$python"
        ASDF_PYTHON_VERSION=$python asdf exec pip install -U pynvim
    fi
done
