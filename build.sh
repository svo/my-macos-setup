#!/bin/bash

export PATH="$PATH:/opt/homebrew/bin/:~/.local/bin" &&

brew_path=`brew --prefix` &&

eval "$(/${brew_path}/bin/brew shellenv)" &&

interpreter=`which python3`

ansible-playbook -i "localhost," -c local -K -e "ansible_python_interpreter='${interpreter}'" playbook.yml
