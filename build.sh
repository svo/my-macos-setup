#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install python
brew install python@2
brew link --overwrite python
brew update
brew upgrade
brew cask upgrade

sudo easy_install pip

pip install ansible==2.4.3.0

ansible-playbook -i "localhost," -c local -K playbook.yml
