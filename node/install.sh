#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

# Don't worry about it :p
[ ! -z "$CHIRPSTRAPPED" ] && exit

eval "$(nodenv init -)"

install_node_versions() {
    for version in $(find $1 -name .node-version -maxdepth 2 | xargs cat | sort | uniq); do
        step "Installing node version $version"
        nodenv install --skip-existing $version
    done
}

[ -d "$HOME/infrastructure" ] && install_node_versions "$HOME/infrastructure"
[ -d "$HOME/src" ] && install_node_versions "$HOME/src"
