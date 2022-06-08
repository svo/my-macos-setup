#!/bin/bash

eval "$(/opt/homebrew/bin/brew shellenv)"

ansible-playbook -i "localhost," -c local -K playbook.yml
