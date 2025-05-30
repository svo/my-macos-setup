#!/bin/bash

sudo rm -rfv /Users/runner/Library/Android/sdk &&

brew remove --force $(brew list --formula) &&

brew remove --cask --force $(brew list) &&

brew update && brew upgrade && brew upgrade --cask &&

brew autoremove &&

brew doctor || true &&

brew install python &&

brew install ansible
