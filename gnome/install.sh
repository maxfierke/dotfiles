#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

if [ ! -x "$(command -v dconf)" ] || [ "$(lsb_release -is)" != "Ubuntu" ]; then
    exit
fi

### Various dconf Settings

step 'Setting some nice defaults'

dconf write "/org/gnome/desktop/input-sources/xkb-options" "['caps:escape']"

step 'Nice defaults set. Might need to logout and log back in for some to take effect'

### GNOME Terminal profile

step 'Loading GNOME terminal profile'
dconf load /org/gnome/terminal/legacy/profiles:/ < $DOTFILES_ROOT/gnome/gnome-terminal-profiles.dconf

### Gesture support
step 'Setting up gesture support'

sudo gpasswd -a $USER input

if [ ! -x "$(command -v ruby)" ]; then
    sudo apt install -y ruby libinput-tools
fi

if [ ! -x "$(command -v fusuma)" ]; then
    sudo gem install fusuma
fi

if [ ! -x "$(command -v fusuma-sendkey)" ]; then
    sudo apt install -y ruby-dev libevdev-dev
    sudo /usr/bin/gem install fusuma-plugin-sendkey
fi

if [ ! -x "$(command -v wmctrl)" ]; then
    sudo apt install -y wmctrl
    sudo /usr/bin/gem install fusuma-plugin-wmctrl
fi

mkdir -p "$HOME/.config/fusuma"

cp "$DOTFILES_ROOT/gnome/fusuma.yml" "$HOME/.config/fusuma/config.yml"

if [ "$(ps -aux | grep 'fusuma' -c)" -le 1 ]; then
    fusuma -d
fi

step 'Swipe gestures have been setup. Be sure to add `fusuma -d` to your startup applications.'
