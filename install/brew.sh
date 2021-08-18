#!/usr/bin/env bash

# Install Homebrew (if not installed)
if test ! $(which brew)
then
  echo "Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install non-cask tools
brew install tig
brew install dockutil
brew install Schniz/tap/fnm
brew install neovim

## Apps I use
# Dev tools
brew install --cask iterm2
brew install --cask postman
brew install --cask visual-studio-code
brew install --cask docker
# Utility
brew install --cask 1password
brew install --cask dropbox
brew install --cask rectangle
# Browsers
brew install --cask google-chrome
# Communication
brew install --cask slack
brew install --cask whatsapp

# Remove outdated versions from the cellar.
brew cleanup
