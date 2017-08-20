tap 'caskroom/cask'
tap 'caskroom/fonts'
tap 'homebrew/homebrew-php'
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
brew 'heroku'
brew 'hub'
brew 'imagemagick'
brew 'jq'
brew 'libpng'
brew 'openssl'
brew 'pkg-config'
brew 'readline'
brew 'wget'

# Language runtimes/compilers/version managers
brew 'crystal-lang', args: ['with-llvm']
brew 'php56' # :pppppppppppp
brew 'php56-intl'
brew 'php56-mcrypt'
brew 'php56-xdebug'
brew 'php56-opcache'
brew 'php56-gmp'
brew 'pyenv'
brew 'rbenv'
brew 'nodenv'
brew 'elixir'

# Services
brew 'nginx', restart_service: :changed
brew 'mysql@5.6', restart_service: :changed
brew 'postgresql', restart_service: :changed unless system('brew ls --versions postgresql@9.4 > /dev/null')
brew 'redis', restart_service: :changed

# Package managers
brew 'composer'
brew 'yarn'

# Development schtuff
brew 'neovim'
brew 'forego'
brew 'watchman'

# Desktop apps
cask 'xquartz'
cask 'atom'
cask 'flux'
cask 'font-fira-code' unless File.exist?(File.expand_path('~/Library/Fonts/FiraCode-Bold.otf'))
cask 'google-chrome'
cask 'gpgtools'
cask 'insomnia'
cask 'iterm2'
cask 'mysqlworkbench'
cask 'postico'
cask 'sequel-pro'
cask 'steam'
cask 'tidal'
cask 'tunnelblick'
cask 'visual-studio-code'
cask 'vlc'
