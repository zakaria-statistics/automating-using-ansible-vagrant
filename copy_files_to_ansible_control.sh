#!/bin/bash

# Get the IP address of ansible_control VM using vagrant ssh-config
ANSIBLE_CONTROL_IP=$(vagrant ssh-config ansible_control | grep HostName | awk '{print $2}')

# Define other variables
USER="vagrant"
ANSIBLE_DIR="/home/vagrant"

# Path to the files on your physical machine
INVENTORY_FILE="ansible_inventory"
SSH_KEY="C:/Users/zakar/.vagrant.d/insecure_private_key"
PLAYBOOK="simple_playbook.yml"

# Copy the inventory file to ansible_control VM
echo "Copying inventory file to ansible_control VM..."
scp $INVENTORY_FILE $USER@$ANSIBLE_CONTROL_IP:$ANSIBLE_DIR/ansible_inventory

# Copy the SSH private key to ansible_control VM
echo "Copying SSH private key to ansible_control VM..."
scp $SSH_KEY $USER@$ANSIBLE_CONTROL_IP:$ANSIBLE_DIR/.vagrant.d/insecure_private_key

# Copy the playbook to ansible_control VM
echo "Copying playbook to ansible_control VM..."
scp $PLAYBOOK $USER@$ANSIBLE_CONTROL_IP:$ANSIBLE_DIR/simple_playbook.yml

# Confirmation message
echo "Files have been copied to ansible_control VM."
