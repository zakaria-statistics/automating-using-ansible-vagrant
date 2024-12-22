Vagrant.configure("2") do |config|

  # Base box for all VMs
  config.vm.box = "generic/ubuntu2204"

  # Ansible Control Plane Configuration (Hyper-V)
  config.vm.define "ansible_control" do |ansible|
    ansible.vm.hostname = "ansible-control"
    ansible.vm.network "private_network", type: "dhcp"
    ansible.vm.provider "hyperv" do |vb|
      vb.memory = "1024"
      vb.maxmemory = "2048"
      vb.cpus = 2
    end
    ansible.vm.provision "shell", inline: <<-SHELL
       # Update and install Ansible
      sudo apt-get update
      sudo apt-get install -y ansible

      # Create directories for incoming files (inventory, keys, playbook)
      mkdir -p /home/vagrant/.vagrant.d
      mkdir -p /home/vagrant/ansible
    SHELL
  end

  # Master Node Configuration (VirtualBox)
  config.vm.define "master" do |master|
    master.vm.hostname = "master"
    master.vm.network "public_network"  # Bridged network
    master.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 4
    end
  end

  # Worker Node Configuration (VMware)
  config.vm.define "worker" do |worker|
    worker.vm.hostname = "worker"
    worker.vm.network "private_network", type: "dhcp"
    worker.vm.provider "vmware_desktop" do |vb|
      vb.memory = "1024"
      vb.cpus = 2
    end
  end

end