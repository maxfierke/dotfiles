#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

if [ "$(uname -s)" == "Darwin" ]; then
    step 'Copying iTerm2 Profiles'
    mkdir -p ~/Library/Application\ Support/iTerm2/DynamicProfiles
    cp $DOTFILES_ROOT/iterm2/profiles.plist ~/Library/Application\ Support/iTerm2/DynamicProfiles
    step_ok 'Copied. You may need to select the dynamic profile "Default" in iTerm2'
fi
