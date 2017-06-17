#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

install_node_versions() {
    for version in $(find $1 -name .node-version -maxdepth 2 | xargs cat | sort | uniq); do
        step "Installing node version $version"
        nodenv install --skip-existing $version
    done
}

install_node_versions "$HOME/infrastructure"
install_node_versions "$HOME/src"
