#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

# Ensure code exists, or exit otherwise
command -v code >/dev/null 2>&1 || exit

# Symlink the settings file
ln -sfv "$DOTFILES_ROOT/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

VSCODE_PACKAGES=(
  g3ortega.crystal
  kofno.crystal-ide
  stevejpurves.cucumber
  msjsdiag.debugger-for-chrome
  codezombiech.gitignore
  tberman.json-schema-validator
  PKief.material-icon-theme
  ricard.postcss
  mohsen1.prettify-json
  rebornix.ruby
  shardulm94.trailing-spaces
  mjmcloug.vscode-elixir
  dbaeumer.vscode-eslint
  Equinusocio.vsc-material-theme
)

for package in "${VSCODE_PACKAGES[@]}"; do
  step "Installing vscode extension: '$package'"
  code --install-extension $package
done
