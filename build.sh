#!/bin/bash

export PATH="$PATH:/opt/homebrew/bin/:~/.local/bin" &&

brew_path=`brew --prefix` &&

eval "$(/${brew_path}/bin/brew shellenv)" &&

interpreter=`which python3`

if [ -t 0 ]; then
  read -s -p "BECOME password: " BECOME_PASS
  echo
  export ANSIBLE_BECOME_PASS=$BECOME_PASS
fi

ansible-playbook -i "localhost," -c local -e "ansible_python_interpreter='${interpreter}'" playbook.yml
