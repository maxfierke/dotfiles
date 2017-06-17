#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

install_ruby_versions() {
    for version in $(find $1 -name .ruby-version -maxdepth 2 | xargs cat | sort | uniq); do
        step "Installing ruby version $version"
        rbenv install --skip-existing $version
    done
}

install_ruby_versions "$HOME/infrastructure"
install_ruby_versions "$HOME/src"
