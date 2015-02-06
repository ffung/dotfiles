#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we're using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don't forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don't forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install openssl
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh

# Install other useful binaries.
brew install git
brew install python3
brew install ssh-copy-id
brew install the_silver_searcher
brew install tmux

# Install some devops tooling.
brew install boot2docker
brew install docker
brew install packer

# Install rcm, a management suite for dotfiles.
brew tap thoughtbot/formulae
brew install rcm

# Install MacVim with split browser support.
brew tap joelcogen/macvimsplitbrowser
brew install macvim-split-browser

# Install casks
brew install caskroom/cask/brew-cask
brew cask install caffeine
brew cask install clipmenu
brew cask install firefox
brew cask install flash-player
brew cask install omnifocus
brew cask install p4v
brew cask install skype
brew cask install sourcetree
brew cask install tunnelblick
brew cask install virtualbox
brew cask install vlc
brew cask install vmware-fusion

brew tap caskroom/versions
brew cask install omnigraffle-professional5

# Remove outdated versions from the cellar.
brew cleanup

