#!/bin/bash

set -e

PL_FONTS_DIR=$DOTFILES_ROOT/vendor/powerline-fonts

if ! [ -d $PL_FONTS_DIR ]; then
    git clone https://github.com/powerline/fonts.git $PL_FONTS_DIR
else
    cd $PL_FONTS_DIR
    git pull
fi

cd $PL_FONTS_DIR
./install.sh

