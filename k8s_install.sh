#!/bin/sh
source ~/.bashrc
ansible-playbook -i hosts 00-init.yml && \
ansible-playbook -i hosts 01-ssl.yml && \
ansible-playbook -i hosts 02-etcd.yml && \
ansible-playbook -i hosts 03-docker.yml && \
ansible-playbook -i hosts 04-k8s-master.yml
