/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if grep -q "brew shellenv" ~/.zprofile; then
  echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> ~/.zprofile
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

brew install --cask microsoft-edge
brew install --cask firefox
brew install --cask adobe-acrobat-pro
brew install --cask microsoft-word
brew install --cask microsoft-excel
brew install --cask microsoft-teams
brew install --cask google-drive
brew install --cask zoom
brew install --cask lastpass
brew install --cask fellow
brew install --cask slack
brew install --cask evernote
brew install --cask jetbrains-toolbox
brew install --cask tableau
brew install --cask tableau-prep
brew install --cask http-toolkit
brew install --cask lens
brew install --cask mimestream
brew install --cask mysqlworkbench
brew install --cask navicat-for-mysql
brew install --cask navicat-premium
brew install --cask orbstack
brew install --cask plex-media-server
brew install --cask postman
brew install --cask raycast
brew install --cask setapp
brew install --cask transmission
brew install --cask viscosity
brew install --cask iterm2
brew install --cask wifi-explorer-pro
brew install --cask whatsapp
brew install --cask bitcoin-core
brew install --cask gpg-suite
brew install --cask microsoft-remote-desktop
brew install --cask vnc-viewer
brew install --cask rightfont
brew install --cask wireshark
brew install --cask spotify
brew install --cask araxis-merge
brew install --cask dadroit-json-viewer
brew install --cask hex-fiend
brew install --cask screaming-frog-seo-spider
brew install --cask polypane
brew install --cask brave-browser

brew install node

brew install pyenv
if grep -q "PYENV_ROOT" ~/.zshrc; then
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
  echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
  echo 'eval "$(pyenv init -)"' >> ~/.zshrc
fi

brew install starship
if grep -q "starship init zsh" ~/.zshrc; then
  echo 'eval "$(starship init zsh)"' >> ~/.zshrc
fi

brew install --cask sublime-text
if grep -q "Sublime" ~/.zprofile'; then
  echo 'export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"' >> ~/.zprofile
fi

brew install mutt
brew install kubectx
brew install poetry
brew install openssl
brwe install sqlite
brew install zlib
brew install libpng
brew install xz
brew install readline
brew install postgresql
brew install git-crypt
brew install csvq
brwe install black
brew install ripgrep
brew install socat
brew install pnpm
brew install htop
brew install btop
brew install jq
brew install yq
brew install step
brew install mtr
brew install wget
brew install b2-tools
brew install kustomize
brew install d2
brew install coreutils
brew install terraform
brew install k9s
brew install duckdb
brew install openjdk@17
brew install golang
brew install binaryen
brew install redis
brew install oven-sh/bun/bun
brew install cilium-cli

brew install elixir
brew tap gigalixir/brew
brew install gigalixir

brew install cockroachdb/tap/cockroach

npm install elasticdump -g
npm install -g @json2csv/cli

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

brew install mysql-client@8.0
if grep -q "mysql-client@8.0" ~/.zshrc; then
  echo 'export PATH="/opt/homebrew/opt/mysql-client@8.0/bin:$PATH"' >> ~/.zshrc
  echo 'export LDFLAGS="-L/opt/homebrew/opt/mysql-client@8.0/lib"' >> ~/.zshrc
  echo 'export CPPFLAGS="-I/opt/homebrew/opt/mysql-client@8.0/include"' >> ~/.zshrc
  echo 'export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql-client@8.0/lib/pkgconfig"' >> ~/.zshrc
fi

brew install kubecolor
if grep -q "kubecolor" ~/.zshrc; then
  echo 'alias kubectl=kubecolor' >> ~/.zshrc
fi

if grep -q "GPG_TTY" ~/.zshrc; then
  echo 'export GPG_TTY=$(tty)' >> ~/.zshrc
fi
