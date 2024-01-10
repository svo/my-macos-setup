#!/bin/bash

source /Users/svo/Library/Application\ Support/pipx/venvs/ansible/bin/activate &&

pnpm setup &&

npx pnpm install --global pnpm &&

topgrade
