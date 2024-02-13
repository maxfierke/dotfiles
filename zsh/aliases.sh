alias be="bundle exec"
alias bake="bundle exec rake"
alias cuke="bundle exec cucumber"
alias reload_shell="exec -l $SHELL"
alias resolve_merge_conflicts="git diff --name-only --diff-filter=U | xargs code"
alias respek="bundle exec rspec"
alias rmc="resolve_merge_conflicts"
alias got=git
alias fix_enter="stty sane"
alias fix_webcam="sudo killall VDCAssistant"
alias maps="telnet mapscii.me"

if command -v nvim >/dev/null 2>&1; then
  alias vim="nvim"
fi

dump_gnome_term_profile() {
  dconf dump /org/gnome/terminal/legacy/profiles:/ > $HOME/.dotfiles/gnome/gnome-terminal-profiles.dconf
}

purge_dns_cache() {
  sudo killall -HUP mDNSResponder
  sudo killall mDNSResponderHelper
  sudo dscacheutil -flushcache
}

list_project_node_versions() {
  for file in $(find $HOME/src -name .node-version -depth 2); do
    echo "$file: $(cat $file)"
  done
}

list_project_ruby_versions() {
  for file in $(find $HOME/src -name .ruby-version -depth 2); do
    echo "$file: $(cat $file)"
  done
}

list_project_python_versions() {
  for file in $(find $HOME/src -name .python-version -depth 2); do
    echo "$file: $(cat $file)"
  done
}
