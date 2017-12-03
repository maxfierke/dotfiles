#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

# Ensure code exists, or exit otherwise
command -v code >/dev/null 2>&1 || exit

# Symlink the settings file
mkdir -p "$HOME/Library/Application Support/Code/User"
ln -sfv "$DOTFILES_ROOT/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

VSCODE_PACKAGES=(
  haaaad.ansible
  ms-vscode.cpptools
  g3ortega.crystal
  kofno.crystal-ide
  stevejpurves.cucumber
  msjsdiag.debugger-for-chrome
  EditorConfig.EditorConfig
  sbrink.elm
  emberjs.emberjs
  codezombiech.gitignore
  eamodio.gitlens
  tberman.json-schema-validator
  PKief.material-icon-theme
  zhuangtongfa.Material-theme
  felixfbecker.php-pack
  ricard.PostCSS
  mohsen1.prettify-json
  esbenp.prettier-vscode
  rebornix.Ruby
  shardulm94.trailing-spaces
  eg2.tslint
  whatwedo.twig
  mjmcloug.vscode-elixir
  dbaeumer.vscode-eslint
  DSKWRK.vscode-generate-getter-setter
  Equinusocio.vsc-material-theme
)

INSTALLED_PACKAGES=( $(code --list-extensions) )

for package in "${VSCODE_PACKAGES[@]}"; do
  step "Installing vscode extension: '$package'"
  if [[ ! " ${INSTALLED_PACKAGES[@]} " =~ " ${package} " ]]; then
    code --install-extension $package
  else
    echo "Already installed $package"
  fi
done
