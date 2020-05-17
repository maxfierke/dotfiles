#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

if [ "$(uname -s)" == "Darwin" ]; then
  # On macOS, we can install through brew cask
  step_skip "Skipping FiraCode installation from GitHub (will do via brew cask)"
  exit
fi

if fc-list | grep -q -i 'Fira Code:style=Regular'; then
  # We got the sauce, let's not get lost
  step_skip "Skipping FiraCode installation (already installed)"
  exit
fi

step "Installing FiraCode from GitHub"
for type in Bold Light Medium Regular Retina; do
  wget -O ~/.local/share/fonts/FiraCode-${type}.ttf \
  "https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true";
done
step_ok "Installed"

step "Clearing font caches"
fc-cache -f
step_ok "Cleared"
