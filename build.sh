#!/bin/bash

eval "$(/opt/homebrew/bin/brew shellenv)"

ansible-playbook -i "localhost," -c local -K -e 'ansible_python_interpreter=/opt/homebrew/bin/python3.11' playbook.yml
