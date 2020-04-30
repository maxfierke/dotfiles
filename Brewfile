tap 'homebrew/cask'
tap 'homebrew/cask-fonts'
tap 'neovim/neovim'

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
brew 'hub'
brew 'imagemagick'
brew 'jq'
brew 'libpng'
brew 'openssl'
brew 'pkg-config'
brew 'pwgen'
brew 'readline'
brew 'spaceman-diff'
brew 'tig'
brew 'wget'
brew 'youtube-dl'
brew 'zlib'

# Language runtimes/compilers/version managers
# Formula is broken in Linuxbrew right now
brew 'crystal-lang' if `uname -s`.chomp == 'Darwin'

# Package managers
brew 'composer'
brew 'yarn'

# Development schtuff
brew 'neovim'
brew 'forego'

if `uname -s`.chomp == 'Darwin'
  # Desktop apps
  cask 'xquartz'
  cask '1password'
  cask '1password-cli'
  cask 'flux'
  cask 'font-fira-code' unless File.exist?(File.expand_path('~/Library/Fonts/FiraCode-Bold.otf'))
  cask 'docker'
  cask 'firefox'
  cask 'google-chrome'
  cask 'gpg-suite'
  cask 'insomnia'
  cask 'iterm2'
  cask 'postico'
  cask 'sequel-pro'
  cask 'slack'
  cask 'steam'
  cask 'tidal'
  cask 'tunnelblick'
  cask 'visual-studio-code'
  cask 'vlc'
end
