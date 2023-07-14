#!/bin/bash

set -eo pipefail
source "$DOTFILES_ROOT"/util/common.sh

if [ -L "$HOME/.config/nvim" ]; then
  step_skip 'Skipping AstroNvim installation, as ~/.config/nvim appears to be symlink to SpaceVim'
  step_skip '    rm ~/.config/nvim and run again if you want to switch to AstroNvim'
  exit
fi

if [ ! -d "$HOME/.config/nvim" ]; then
  step 'Installing AstroNvim for neovim'
  git clone --depth 1 https://github.com/AstroNvim/AstroNvim.git ~/.config/nvim
  nvim  --headless -c 'autocmd User LazyDone quitall'
  step_ok 'Installed'
fi

if command -v cargo > /dev/null 2>&1; then
  step 'Install tree-sitter-cli for AstroNvim auto-install of language support'
  cargo install tree-sitter-cli
fi

# Symlink the settings file
mkdir -p "$HOME/.config/nvim/lua"
ln -sfv "$DOTFILES_ROOT/astronvim/lua/user" "$HOME/.config/nvim/lua/user"

if command -v nvim > /dev/null 2>&1; then
  step 'Updating AstroNvim'
  nvim --headless -c 'AstroUpdate' -c 'quitall'
  nvim --headless -c 'AstroUpdatePackages' -c 'quitall'
  nvim --headless -c 'Lazy check' -c 'Lazy sync' -c 'quitall'

  LANGUAGES=(
    c
    cmake
    cpp
    css
    dart
    devicetree
    diff
    dockerfile
    dot
    eex
    elixir
    erlang
    gitignore
    go
    graphql
    hcl
    html
    javascript
    json
    llvm
    make
    markdown
    markdown_inline
    meson
    ninja
    nix
    php
    proto
    ron
    rst
    ruby
    rust
    scss
    sql
    toml
    tsx
    twig
    typescript
    yaml
    zig
  )

  for language in "${LANGUAGES[@]}"; do
    step "Installing language parser for nvim: '$language'"
    nvim --headless -c "TSInstall $language" -c 'quitall'
  done

  LSPS=(
    clangd
    # broken on arm64: crystalline
    elixirls
    gopls
    html
    ruby_ls
    rust_analyzer
    tsserver
    zls
  )

  for lsp in "${LSPS[@]}"; do
    step "Installing LSP for nvim: '$lsp'"
    nvim --headless -c "LspInstall $lsp" -c 'quitall'
  done

  DEBUGGERS=(
    ruby
  )

  for debugger in "${DEBUGGERS[@]}"; do
    step "Installing debugger for nvim: '$debugger'"
    nvim --headless -c "DapInstall $debugger" -c 'quitall'
  done
fi
