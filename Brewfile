tap 'homebrew/cask'
tap 'homebrew/cask-fonts'
tap 'neovim/neovim'

cask_args appdir: '~/Applications'

brew 'ack'
brew 'autoconf'
brew 'awscli'
brew 'bash-completion'
brew 'coreutils'
brew 'curl'
brew 'findutils'
brew 'gcc'
brew 'git'
brew 'gnu-sed'
brew 'gnu-tar'
brew 'gnupg'
brew 'hub'
brew 'imagemagick'
brew 'jq'
brew 'libpng'
brew 'openssl'
brew 'pkg-config'
brew 'readline'
brew 'spaceman-diff'
brew 'tig'
brew 'wget'
brew 'youtube-dl'
brew 'zlib'

# Language runtimes/compilers/version managers
brew 'crystal-lang', args: ['with-llvm']

brew 'pyenv'
brew 'rbenv'
brew 'nodenv'
brew 'elixir' if `uname -s`.chomp == 'Darwin' # elixir from linuxbrew is reeeeeeallllly slow for some reason

# Services
brew 'nginx', restart_service: :changed
brew 'mysql@5.6', restart_service: :changed
brew 'postgresql', restart_service: :changed unless system('brew ls --versions postgresql@9.4.15 > /dev/null')
brew 'redis', restart_service: :changed

# Package managers
brew 'composer'
brew 'yarn', args: ['without-node']

# Development schtuff
brew 'neovim'
brew 'forego'

if `uname -s`.chomp == 'Darwin'
  # Desktop apps
  cask 'xquartz'
  cask 'atom'
  cask 'flux'
  cask 'font-fira-code' unless File.exist?(File.expand_path('~/Library/Fonts/FiraCode-Bold.otf'))
  cask 'docker'
  cask 'google-chrome'
  cask 'gpg-suite'
  cask 'insomnia'
  cask 'iterm2'
  cask 'mysqlworkbench'
  cask 'postico'
  cask 'sequel-pro'
  cask 'slack'
  cask 'steam'
  cask 'tidal'
  cask 'tunnelblick'
  cask 'visual-studio-code'
  cask 'vlc'
end
