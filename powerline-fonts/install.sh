#!/bin/bash

set -euo pipefail
source $DOTFILES_ROOT/util/common.sh

PL_FONTS_DIR=$DOTFILES_ROOT/vendor/powerline-fonts

if ! [ -d $PL_FONTS_DIR ]; then
    step "Fetching Powerline fonts"
    git clone https://github.com/powerline/fonts.git $PL_FONTS_DIR
    step_ok "Fetched Powerline fonts. Stored in $PL_FONTS_DIR."
else
    step "Updating Powerline fonts"
    cd $PL_FONTS_DIR
    git pull
    step_ok "Updated"
fi

step "Installing Powerline fonts"
cd $PL_FONTS_DIR
./install.sh || true
step_ok "Installed"
