#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

if command -v rustup 2>&1 > /dev/null; then
  step "Updating Rust via rustup"
  rustup update
else
  step "Rustup not installed. Installing rustup"
  curl https://sh.rustup.rs -sSf | sh
fi

if command -v cargo 2>&1 > /dev/null; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

step "Defaulting to nightly rust"
rustup default nightly

#step "Installing some good Rust development crates"
#cargo install -f racer
#cargo install -f rustfmt
#cargo install -f rustsym
