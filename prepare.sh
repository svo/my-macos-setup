#!/bin/bash

chsh -s /bin/zsh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &&

eval "$(/opt/homebrew/bin/brew shellenv)" &&

/usr/sbin/softwareupdate --install-rosetta --agree-to-license &&

brew update && brew upgrade && brew upgrade --cask &&

brew doctor || true &&

brew install python &&

brew install ansible
