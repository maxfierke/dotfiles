#!/usr/bin/env bash

export DOTFILES_ROOT="$HOME/.dotfiles"

if command -v rbenv >/dev/null 2>&1; then eval "$(rbenv init -)"; fi
if command -v nodenv >/dev/null 2>&1; then eval "$(nodenv init -)"; fi
if command -v pyenv >/dev/null 2>&1; then eval "$(pyenv init -)"; fi
if [ -d "$HOME/.cargo/env" ]; then source "$HOME/.cargo/env"; fi
