#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

# Don't worry about it :p
[ ! -z "$CHIRPSTRAPPED" ] && exit

if [ -x "$(command -v pyenv)" ]; then
    eval "$(pyenv init -)"
else
    echo "Skipping, as pyenv is not installed."
    exit
fi

if [ -x "$(command -v brew)" ]; then
    export CFLAGS="-I$(brew --prefix openssl)/include"
    export LDFLAGS="-L$(brew --prefix openssl)/lib"
fi

install_python_versions() {
    for version in $(find $1 -name .python-version -maxdepth 2 | xargs cat | sort | uniq); do
        step "Installing python version $version"
        pyenv install --skip-existing $version
        pyenv shell $version
        pyenv rehash
        pip install -U pip
        pip install -U neovim
    done
}

[ -d "$HOME/infrastructure" ] && install_python_versions "$HOME/infrastructure"
[ -d "$HOME/src" ] && install_python_versions "$HOME/src"
