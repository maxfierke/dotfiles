#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

PL_FONTS_DIR=$DOTFILES_ROOT/vendor/powerline-fonts


step "Updating Powerline fonts"
if ! [ -d $PL_FONTS_DIR ]; then
    git clone https://github.com/powerline/fonts.git $PL_FONTS_DIR
else
    cd $PL_FONTS_DIR
    git pull
fi

step "Installing Powerline fonts"
cd $PL_FONTS_DIR
./install.sh || true

