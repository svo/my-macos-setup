#!/bin/bash

export PATH="$PATH:/opt/homebrew/bin/:~/.local/bin" &&

brew_path=`brew --prefix` &&

eval "$(/${brew_path}/bin/brew shellenv)" &&

ansible-playbook -i "localhost," -c local -K -e "ansible_python_interpreter='$HOME/Library/Application Support/pipx/venvs/ansible/bin/python3'" playbook.yml
