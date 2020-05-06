#!/bin/bash

chsh -s /bin/zsh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &&

brew update && brew upgrade && brew cask upgrade &&

brew doctor || true &&

brew install python &&

pip3 install ansible
