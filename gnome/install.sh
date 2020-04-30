#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

if [ ! -x "$(command -v dconf)" ]; then
    exit
fi

step 'Setting some nice defaults'

dconf write "/org/gnome/desktop/input-sources/xkb-options" "['caps:escape']"

step 'Nice defaults set. Might need to logout and log back in for some to take effect'
