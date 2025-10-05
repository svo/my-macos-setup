#!/bin/bash

export PIPX_HOME_ALLOW_SPACE=true

if command -v pnpm &> /dev/null; then
    pnpm config set store-dir ~/.pnpm-store/v10 --global 2>/dev/null || true
    if [ -d ~/Library/pnpm/global/5/node_modules ]; then
        rm -rf ~/Library/pnpm/global/5/node_modules
        pnpm install -g &>/dev/null
    fi
fi

topgrade
