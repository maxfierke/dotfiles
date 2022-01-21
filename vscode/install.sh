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
  stevejpurves.cucumber
  msjsdiag.debugger-for-chrome
  EditorConfig.EditorConfig
  embertooling.emberjs
  codezombiech.gitignore
  eamodio.gitlens
  zhuangtongfa.material-theme
  azemoh.one-monokai
  felixfbecker.php-pack
  ricard.postcss
  mohsen1.prettify-json
  esbenp.prettier-vscode
  rebornix.ruby
  rust-lang.rust
  shardulm94.trailing-spaces
  whatwedo.twig
  mjmcloug.vscode-elixir
  dbaeumer.vscode-eslint
  dtsvet.vscode-wasm
)

REMOVE_VSCODE_PACKAGES=(
  PKief.material-icon-theme
  monokai.theme-monokai-pro-vscode
  tberman.json-schema-validator
  eg2.tslint
  Equinusocio.vsc-material-theme
  DSKWRK.vscode-generate-getter-setter
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
