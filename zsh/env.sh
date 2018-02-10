#!/usr/bin/env bash

export DOTFILES_ROOT="$HOME/.dotfiles"

# Ensure Homebrew rbenv/nodeenv/pyenv are setup correctly
export RBENV_ROOT=/usr/local/opt/rbenv
export NODENV_ROOT=/usr/local/opt/nodenv
export PYENV_ROOT=/usr/local/opt/pyenv
export PATH="$RBENV_ROOT/bin:$NODENV_ROOT/bin:$PYENV_ROOT/bin:/usr/local/sbin:$PATH"

if command -v rbenv >/dev/null 2>&1; then eval "$(rbenv init -)"; fi
if command -v nodenv >/dev/null 2>&1; then eval "$(nodenv init -)"; fi
if command -v pyenv >/dev/null 2>&1; then eval "$(pyenv init -)"; fi
if [ -d "$HOME/.cargo/env" ]; then source "$HOME/.cargo/env"; fi
