#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

# Don't worry about it :p
[ ! -z "$CHIRPSTRAPPED" ] && exit

eval "$(pyenv init -)"

if [ -x "$(command -v brew)" ]; then
    export CFLAGS="-I$(brew --prefix openssl)/include"
    export LDFLAGS="-L$(brew --prefix openssl)/lib"
fi

install_python_versions() {
    for version in $(find $1 -name .python-version -maxdepth 2 | xargs cat | sort | uniq); do
        step "Installing python version $version"
        pyenv install --skip-existing $version
    done
}

[ -d "$HOME/infrastructure" ] && install_python_versions "$HOME/infrastructure"
[ -d "$HOME/src" ] && install_python_versions "$HOME/src"
