#!/usr/bin/env bash

if ! command -v brew >/dev/null 2>&1; then
    HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-}
    if [ -d "/opt/homebrew" ]; then
        HOMEBREW_PREFIX=/opt/homebrew
    elif [ -d "/home/linuxbrew/.linuxbrew" ]; then
        HOMEBREW_PREFIX=/home/linuxbrew/.linuxbrew
    fi

    if [ ! -z "$HOMEBREW_PREFIX" ]; then
        eval $($HOMEBREW_PREFIX/bin/brew shellenv)
    fi
fi

if command -v snap >/dev/null 2>&1; then
    if ! echo "$PATH" | grep -q ':/snap/bin'; then
        # Add snap bin to PATH if it wasn't set correctly by OS
        export PATH="$PATH:/snap/bin"
    fi
fi

if [ -d "$HOME/.fly" ]; then
   export FLYCTL_INSTALL="$HOME/.fly"
   export PATH="$FLYCTL_INSTALL/bin:$PATH"
fi

if command -v rbenv >/dev/null 2>&1; then eval "$(rbenv init -)"; fi
if command -v nodenv >/dev/null 2>&1; then eval "$(nodenv init -)"; fi
if command -v pyenv >/dev/null 2>&1; then eval "$(pyenv init -)"; fi
