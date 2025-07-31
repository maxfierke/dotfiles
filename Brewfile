tap 'homebrew/cask-fonts'
tap 'neovim/neovim'

brew 'ack'
brew 'autoconf'
brew 'awscli'
brew 'coreutils'
brew 'curl'
brew 'findutils'
brew 'fzf'
brew 'git'
brew 'glow'
brew 'gnu-sed'
brew 'gnu-tar'
brew 'imagemagick'
brew 'jq'
brew 'libpng'
brew 'openssl'
brew 'pkg-config'
brew 'pwgen'
brew 'readline'
brew 'tig'
brew 'tree'
brew 'wget'
brew 'youtube-dl'
brew 'zlib'

# Language runtimes/compilers/version managers
# Formula is broken in Linuxbrew right now
brew 'crystal' if OS.mac?

# Package managers
brew 'yarn'

# Development schtuff
brew 'neovim'
brew 'forego'

# Dependencies for things downstream

## pg gem
brew 'libpq', link: true, force: true, conflicts_with: ["postgresql"]

if OS.mac?
  # Desktop apps
  cask 'xquartz'
  cask 'font-fira-code' unless File.exist?(File.expand_path('~/Library/Fonts/FiraCode-Bold.otf'))
  cask 'firefox' unless File.exist?('/Applications/Firefox.app')
  cask 'google-chrome' unless File.exist?('/Applications/Google Chrome.app')
  cask 'insomnia'
  cask 'iterm2' unless File.exist?('/Applications/iTerm.app')
  cask 'postico'
  cask 'slack' unless File.exist?('/Applications/Slack.app')
  cask 'steam'
  cask 'visual-studio-code' unless File.exist?('/Applications/Visual Studio Code.app')
  cask 'vlc'
  cask 'zed'
end

vscode 'redhat.ansible'
vscode 'ms-vscode.cpptools'
vscode 'crystal-lang-tools.crystal-lang'
vscode 'plorefice.devicetree'
vscode 'EditorConfig.EditorConfig'
vscode 'eamodio.gitlens'
vscode 'golang.go'
vscode 'ms-vscode.js-debug'
vscode 'rreverser.llvm'
vscode 'asabil.meson'
vscode 'zhuangtongfa.material-theme'
vscode 'azemoh.one-monokai'
vscode 'pest.pest-ide-tools'
vscode 'ricard.postcss'
vscode 'esbenp.prettier-vscode'
vscode 'Shopify.ruby-lsp'
vscode 'rust-lang.rust-analyzer'
vscode 'svelte.svelte-vscode'
vscode 'hashicorp.terraform'
vscode 'shardulm94.trailing-spaces'
vscode 'dbaeumer.vscode-eslint'
vscode 'bradlc.vscode-tailwindcss'
vscode 'dtsvet.vscode-wasm'
vscode 'MS-vsliveshare.vsliveshare'
vscode 'secretlab.yarn-spinner'
