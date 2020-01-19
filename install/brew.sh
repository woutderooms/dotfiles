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

## Apps I use
# Dev tools
brew cask install iterm2
brew cask install postman
brew cask install visual-studio-code
brew cask install gitkraken
# Utility
brew cask install 1password
brew cask install dropbox
brew cask install spectacle
# Browsers
brew cask install google-chrome
# Communication
brew cask install slack
brew cask install whatsapp

# Remove outdated versions from the cellar.
brew cleanup