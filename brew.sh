#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

brew analytics off

# Make sure we're using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don't forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don't forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion
brew install bats

# Install more recent versions of some OS X tools.
brew tap neovim/neovim
brew install neovim
#brew install vim --with-override-system-vi
brew install openssl
brew install homebrew/dupes/grep

# Install other useful binaries.
brew install ctags
brew install git
brew install git-lfs
brew install ssh-copy-id
brew install jq
brew install the_silver_searcher
brew install tmux

# Install some build tooling
brew install gradle

# Install python environments via pyenv
brew install pyenv
brew install pyenv-virtualenv

# Install ruby environments via rbenv
brew install rbenv
brew install ruby-build
brew install rbenv-gem-rehash

# Install some devops tooling.
brew install docker
brew install docker-compose
brew install docker-machine
brew install docker-swarm
brew install kubernetes-cli

brew tap homebrew/binary
brew install packer

# Install casks
brew cask install virtualbox
brew cask install vagrant
brew cask install java
brew cask install haskell-platform
brew cask install xquartz
brew cask install tunnelblick
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv
brew cask install --appdir="/Applications" macvim
brew cask install --appdir="/Applications" caffeine
brew cask install --appdir="/Applications" clipmenu
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" flux
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" libreoffice
brew cask install --appdir="/Applications" omnifocus
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" sourcetree
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" vitamin-r
brew cask install --appdir="/Applications" vmware-fusion

brew tap caskroom/versions
brew cask install --appdir="/Applications" omnigraffle-professional5

brew tap homebrew/versions
# Remove outdated versions from the cellar.
brew cleanup
