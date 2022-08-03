#!/usr/bin/env bash

# Check for Homebrew, Install if we don't have it
if test ! $(which brew); then
    echo '================================================================================'
    echo 'Installing homebrew...'
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo 'Done installing homebrew.'
    echo '================================================================================'
fi

# Update homebrew recipes
echo '================================================================================'
echo 'Installing, updating, and cleaning up brew dependencies...'
brew bundle --global
brew bundle cleanup --force --global
brew services cleanup
sudo brew services cleanup
brew cleanup -s

# make directory in case they aren't already there
mkdir -p "/usr/local/lib"
mkdir -p "/usr/local/bin"

# Install and use latest bash
echo '================================================================================'
echo 'Installing bash'
brew install bash
chsh -s /usr/local/bin/bash

# Install git
brew install git

# Install nvm
echo "Installing nvm..."
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
nvm install stable
nvm alias default stable

# Centralize global npm packages for different node versions
echo "prefix = /usr/local" > ~/.npmrc

# Install Node modules
modules=(
  nr
  n
  lerna
  @nestjs/cli
  nodemon
  typescript
  gulp
  @vue/cli
  firebase-tools
  anywhere
  webpack
  vite
)

echo "installing node modules..."
npm install -g ${modules[@]}

# Install Brew Cask
echo "Installing brew cask..."
brew install caskroom/cask/brew-cask

tap 'homebrew/services'

# php monitor
brew tap 'nicoverbruggen/homebrew-cask'

# dependencies
brew 'pkg-config'

# foundation
foundations=(
    composer
    dnsmasq
    redis
    rabbitmq
    watchman
    mysql
    php@8.1
    php@8.0
    php@7.4
    yarn
    pnpm
    node
    sqlite
    nginx
    mongodb-community
    grep
    vim
    zsh
    zsh-async
    zsh-autosuggestions
    zsh-syntax-highlighting
    sonarqube
    gnupg
    coreutils
    beanstalkd
)

# Install foudations
echo "installing foundations..."
brew ${foundations[@]}

# Apps
apps=(
  google-chrome
  firefox
  iterm2
  sublime-text3
  docker
  postman
  tableplus
  fig
  zoom
  phpstorm
  goland
  raycast
  DBngin
  phpmon
  linear
  skype
  imageoptim
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}