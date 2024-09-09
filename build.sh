#!/bin/bash

export PATH="$PATH:/opt/homebrew/bin/:~/.local/bin" &&

brew_path=`brew --prefix` &&

eval "$(/${brew_path}/bin/brew shellenv)" &&

ansible_path=`which ansible`
interpreter_directory=`readlink -f ${ansible_path} | sed 's|\(.*\)/.*|\1|'`

ansible-playbook -i "localhost," -c local -K -e "ansible_python_interpreter='${interpreter_directory}/python3'" playbook.yml
