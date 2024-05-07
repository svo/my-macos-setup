#!/bin/bash

user=`whoami`
source /Users/${user}/Library/Application\ Support/pipx/venvs/ansible/bin/activate &&

pnpm setup &&

npx pnpm install --global pnpm &&

topgrade
