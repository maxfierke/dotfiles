#!/bin/bash

set -e

PL_FONTS_DIR=$DOTFILES_ROOT/vendor/powerline-fonts

git clone https://github.com/powerline/fonts.git $PL_FONTS_DIR

cd $PL_FONTS_DIR
./install.sh

cd ../$PL_FONTS_DIR
rm -rf $PL_FONTS_DIR
