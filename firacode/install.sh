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

fonts_dir="${HOME}/.local/share/fonts"
if [ ! -d "${fonts_dir}" ]; then
    echo "mkdir -p $fonts_dir"
    mkdir -p "${fonts_dir}"
else
    echo "Found fonts dir $fonts_dir"
fi

version=6.2
zip=Fira_Code_v${version}.zip
curl --fail --location --show-error https://github.com/tonsky/FiraCode/releases/download/${version}/${zip} --output ${zip}
unzip -o -q -d ${fonts_dir} ${zip}
rm ${zip}

step_ok "Installed"

step "Clearing font caches"
fc-cache -f
step_ok "Cleared"
