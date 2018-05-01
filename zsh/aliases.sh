alias be="bundle exec"
alias bake="bundle exec rake"
alias cuke="bundle exec cucumber"
alias reload_shell="exec -l $SHELL"
alias resolve_merge_conflicts="git diff --name-only --diff-filter=U | xargs code"
alias respek="bundle exec rspec"
alias rmc="resolve_merge_conflicts"
alias ect="ember test -s --launch Chrome"
alias got=git
alias fix_enter="stty sane"
alias fix_webcam="sudo killall VDCAssistant"
alias maps="telnet mapscii.me"
alias vim="nvim"

respawn_rabbitmq() {
  until rabbitmqctl cluster_status; do
    brew services restart rabbitmq
    sleep 5
  done

  echo 'Success!'
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
