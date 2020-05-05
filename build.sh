#!/bin/bash

ansible-playbook -i "localhost," -c local -K playbook.yml

topgrade
