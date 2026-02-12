#!/bin/bash

set -e
source $DOTFILES_ROOT/util/common.sh

step 'Setting up git config'

# Mostly from https://blog.gitbutler.com/how-git-core-devs-configure-git/#clearly-makes-git-better
git config --global branch.sort -committerdate
git config --global column.ui auto
git config --global diff.algorithm histogram
git config --global diff.colorMoved plain
git config --global diff.mnemonicPrefix true
git config --global diff.renames true
git config --global fetch.prune true
git config --global fetch.pruneTags true
git config --global fetch.all true
git config --global init.defaultBranch main
git config --global push.autoSetupRemote true
git config --global rebase.updateRefs true
git config --global rerere.enabled true
git config --global rerere.autoupdate true
git config --global tag.sort version:refname

# Setup delta for diffing
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3

step_ok 'Done'
