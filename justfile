sudo_flags := "-K"

default:
    @just --list

check:
    ansible-playbook --syntax-check configure_lab.yml show.yml

ping:
    ansible lab -i inventory.local.ini -m ansible.builtin.ping

plan host="all":
    ansible-playbook -i inventory.local.ini configure_lab.yml --limit '{{host}}' --check --diff {{sudo_flags}}

apply host:
    ansible-playbook -i inventory.local.ini configure_lab.yml --limit '{{host}}' {{sudo_flags}}

show host="all":
    ansible-playbook -i inventory.local.ini show.yml --limit '{{host}}'
