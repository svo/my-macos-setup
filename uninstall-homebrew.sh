#!/bin/bash

brew remove --force $(brew list --formula)

brew remove --cask --force $(brew list)

curl -sLO https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh
chmod +x ./uninstall.sh
sudo ./uninstall.sh --force
