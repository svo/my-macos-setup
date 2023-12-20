#!/bin/bash

brew_path=`brew --prefix`
curl -sLO https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh
chmod +x ./uninstall.sh
sudo ./uninstall.sh --force
