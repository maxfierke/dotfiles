#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

install_python_versions() {
    for version in $(find $1 -name .python-version -maxdepth 2 | xargs cat | sort | uniq); do
        step "Installing python version $version"
        pyenv install --skip-existing $version
    done
}

install_python_versions "$HOME/infrastructure"
install_python_versions "$HOME/src"
