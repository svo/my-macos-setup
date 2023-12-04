#!/bin/bash

chsh -s /bin/zsh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &&

ln -s /usr/local/bin/brew /opt/homebrew/bin/brew &&

eval "$(/opt/homebrew/bin/brew shellenv)" &&

/usr/sbin/softwareupdate --install-rosetta --agree-to-license &&

brew update && brew upgrade && brew upgrade --cask &&

brew doctor || true &&

brew install python &&
brew install pipx &&

pipx install --include-deps ansible
