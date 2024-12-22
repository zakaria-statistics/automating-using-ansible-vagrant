#!/bin/bash

# Get the IP address for each VM using Vagrant SSH config
MASTER_IP=$(vagrant ssh-config master | grep HostName | awk '{print $2}')
WORKER_IP=$(vagrant ssh-config worker | grep HostName | awk '{print $2}')

# Create the inventory file
cat <<EOL > /home/vagrant/ansible_inventory
[master]
master ansible_host=$MASTER_IP ansible_user=vagrant ansible_ssh_private_key_file=/home/vagrant/.vagrant.d/insecure_private_key

[worker]
worker ansible_host=$WORKER_IP ansible_user=vagrant ansible_ssh_private_key_file=/home/vagrant/.vagrant.d/insecure_private_key

[all:vars]
ansible_python_interpreter=/usr/bin/python3
EOL

# Output the inventory file location
echo "Ansible inventory file created at: /home/vagrant/ansible_inventory"
