#!/bin/bash

./uninstall-homebrew.sh
sudo rm -rf /Applications/Google\ Chrome.app
sudo rm -rf /Library/Frameworks/Python.framework

chsh -s /bin/zsh

mkdir /opt/homebrew &&
curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C /opt/homebrew &&

eval "$(/opt/homebrew/bin/brew shellenv)" &&

/usr/sbin/softwareupdate --install-rosetta --agree-to-license &&

brew update && brew upgrade && brew upgrade --cask &&

brew doctor || true &&

brew install python &&
brew install pipx &&

pipx install --include-deps ansible
