tap 'homebrew/cask'
tap 'homebrew/cask-fonts'
tap 'mitchellh/gon' if `uname -s`.chomp == 'Darwin'
tap 'neovim/neovim'

brew 'ack'
brew 'autoconf'
brew 'awscli'
brew 'bash-completion'
brew 'coreutils'
brew 'curl'
brew 'findutils'
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
brew 'tig'
brew 'wget'
brew 'youtube-dl'
brew 'zlib'

# Language runtimes/compilers/version managers
# Formula is broken in Linuxbrew right now
brew 'crystal-lang' if `uname -s`.chomp == 'Darwin' && `arch`.chomp != "arm64"

# Package managers
brew 'composer'
brew 'yarn'

# Development schtuff
brew 'neovim' unless RUBY_PLATFORM =~ /arm64e?-darwin/
brew 'forego'

if `uname -s`.chomp == 'Darwin'
  brew 'gon'

  # Desktop apps
  cask 'xquartz'
  cask 'flux'
  cask 'font-fira-code' unless File.exist?(File.expand_path('~/Library/Fonts/FiraCode-Bold.otf'))
  cask 'docker'
  cask 'firefox'
  cask 'google-chrome' unless File.exist?('/Applications/Google Chrome.app')
  cask 'insomnia'
  cask 'iterm2'
  cask 'postico'
  cask 'slack'
  cask 'steam'
  cask 'tidal'
  cask 'visual-studio-code'
  cask 'vlc'
end
