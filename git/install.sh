#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

SPACEMAN_DIFF_PATH=/usr/local/bin

if [ -x "$SPACEMAN_DIFF_PATH/spaceman-diff" ]; then
  mkdir -p ~/.config/git
  touch ~/.config/git/attributes

  if ! grep -q -i 'spaceman-diff' ~/.config/git/attributes; then
    cat <<-HEREDOC >> ~/.config/git/attributes
*.png  diff=spaceman-diff
*.jpg  diff=spaceman-diff
*.jpeg diff=spaceman-diff
*.gif  diff=spaceman-diff
HEREDOC
  fi

  git config --global diff.spaceman-diff.command "$SPACEMAN_DIFF_PATH/spaceman-diff"
fi
