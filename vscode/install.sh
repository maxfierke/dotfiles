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

VSCODE_PACKAGES=(
  redhat.ansible
  ms-vscode.cpptools
  crystal-lang-tools.crystal-lang
  plorefice.devicetree
  EditorConfig.EditorConfig
  codezombiech.gitignore
  eamodio.gitlens
  ms-vscode.js-debug
  zhuangtongfa.material-theme
  azemoh.one-monokai
  xdebug.php-pack
  ricard.postcss
  mohsen1.prettify-json
  esbenp.prettier-vscode
  Shopify.ruby-lsp
  rust-lang.rust-analyzer
  shardulm94.trailing-spaces
  whatwedo.twig
  mjmcloug.vscode-elixir
  lifeart.vscode-ember-unstable
  dbaeumer.vscode-eslint
  dtsvet.vscode-wasm
  MS-vsliveshare.vsliveshare
  secretlab.yarn-spinner
)

REMOVE_VSCODE_PACKAGES=(
  haaaad.ansible
  stevejpurves.cucumber
  msjsdiag.debugger-for-chrome
  embertooling.emberjs
  felixbecker.php-pack
  PKief.material-icon-theme
  rebornix.ruby
  rust-lang.rust
  monokai.theme-monokai-pro-vscode
  tberman.json-schema-validator
  eg2.tslint
  Equinusocio.vsc-material-theme
  embertooling.vscode-ember
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

for package in "${VSCODE_PACKAGES[@]}"; do
  step "Installing vscode extension: '$package'"
  if [ -z "$INSTALLED_PACKAGES" ] || [[ ! " ${INSTALLED_PACKAGES[@]} " =~ " ${package} " ]]; then
    code --install-extension $package
    step_ok "Installed"
  else
    step_skip "Already installed $package"
  fi
done
