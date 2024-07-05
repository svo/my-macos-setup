#!/bin/bash

user=`whoami`
export PATH="$PATH:/opt/homebrew/bin/:/Users/${user}/Library/Application Support/pipx/venvs/ansible/bin/" &&

brew_path=`brew --prefix` &&

eval "$(/${brew_path}/bin/brew shellenv)" &&

ansible-playbook -i "localhost," -c local -K -e "ansible_python_interpreter=${brew_path}/bin/python3.11" playbook.yml
