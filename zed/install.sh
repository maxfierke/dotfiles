#!/bin/bash

set -eo pipefail
source $DOTFILES_ROOT/util/common.sh

# Ensure zed exists, or exit otherwise
command -v zed >/dev/null 2>&1 || exit

ZED_USER_DIR="$HOME/.config/zed"

# Symlink the settings file
mkdir -p "$ZED_USER_DIR"
ln -sfv "$DOTFILES_ROOT/zed/settings.json" "$ZED_USER_DIR/settings.json"
