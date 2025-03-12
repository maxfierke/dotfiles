#!/bin/bash

set -eo pipefail
source $DOTFILES_ROOT/util/common.sh

# Ensure code exists, or exit otherwise
command -v code >/dev/null 2>&1 || exit

if [ "$(uname -s)" == "Darwin" ]; then
  CODE_USER_DIR="$HOME/Library/Application Support/Code/User"
elif [ "$(uname -s)" == "Linux" ]; then
  CODE_USER_DIR="$HOME/.config/Code/User"
fi

# Symlink the settings file
mkdir -p "$CODE_USER_DIR"
ln -sfv "$DOTFILES_ROOT/vscode/settings.json" "$CODE_USER_DIR/settings.json"

REMOVE_VSCODE_PACKAGES=(
  haaaad.ansible
  stevejpurves.cucumber
  msjsdiag.debugger-for-chrome
  embertooling.emberjs
  phanitejakomaravolu.emberes6snippets
  codezombiech.gitignore
  mohsen1.prettify-json
  felixbecker.php-pack
  ms-vscode.makefile-tools
  PKief.material-icon-theme
  rebornix.ruby
  rust-lang.rust
  monokai.theme-monokai-pro-vscode
  tberman.json-schema-validator
  eg2.tslint
  Equinusocio.vsc-material-theme
  embertooling.vscode-ember
  lifeart.vscode-ember-unstable
  mjmcloug.vscode-elixir
  DSKWRK.vscode-generate-getter-setter
  wingrunr21.vscode-ruby
)

INSTALLED_PACKAGES=( $(code --list-extensions) )

if [ ! -z "$INSTALLED_PACKAGES" ]; then
  for package in "${REMOVE_VSCODE_PACKAGES[@]}"; do
    if [[ " ${INSTALLED_PACKAGES[@]} " =~ " ${package} " ]]; then
      step "Uninstalling vscode extension: '$package'"
      code --uninstall-extension $package
      step_ok "Uninstalled"
    fi
  done
fi
