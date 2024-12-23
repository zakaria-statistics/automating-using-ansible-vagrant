#!/bin/bash

# Define the local path for the inventory file
LOCAL_INVENTORY_FILE="./ansible_inventory"

# Ensure the directory exists
mkdir -p $(dirname "$LOCAL_INVENTORY_FILE")

# Get the bridged IP address (eth1) of master VM
MASTER_IP=$(vagrant ssh master -c "ip addr show eth1 | grep 'inet ' | awk '{print \$2}' | cut -d/ -f1")

# Create the inventory file locally
cat <<EOL > $LOCAL_INVENTORY_FILE
[master]
master ansible_host=$MASTER_IP ansible_user=vagrant ansible_ssh_private_key_file=/home/vagrant/.vagrant.d/insecure_private_key

[all:vars]
ansible_python_interpreter=/usr/bin/python3
EOL

# Output the inventory file location and IP
echo "Ansible inventory file created locally at: $LOCAL_INVENTORY_FILE"
echo "Master VM bridged IP (eth1): $MASTER_IP"