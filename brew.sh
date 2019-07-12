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
brew install gnu-sed

brew install zsh
# Install Bash 4.
# Note: don't forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
# brew install bash
# brew install bash-completion
# brew install bats

# Install more recent versions of some OS X tools.
brew install neovim
brew install openssl
brew install grep

# Install other useful binaries.
brew install git
brew install ctags
brew install ag
brew install fzf
brew install jq
brew install tmux

# Install some build tooling
# brew install gradle

# Install python environments via pyenv
brew install pyenv
brew install pyenv-virtualenv

# Install ruby environments via rbenv
# brew install rbenv
# brew install ruby-build
# brew install rbenv-gem-rehash

# Install haskell
brew install haskell-stack

# Install some devops tooling.
brew install docker
brew install docker-compose
brew install docker-machine
brew install docker-swarm
brew install kubernetes-cli

# Install casks
brew cask install iterm2
brew cask install gpg-suite-no-mail
brew cask install firefox
brew cask install slack
brew cask install dropbox
brew cask install clipy
brew cask install intelliscape-caffeine
brew cask install spectacle

brew cask install virtualbox
brew cask install vagrant

# Remove outdated versions from the cellar.
brew cleanup
