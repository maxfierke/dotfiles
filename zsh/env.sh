#!/usr/bin/env bash

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
