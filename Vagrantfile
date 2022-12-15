Vagrant.configure("2") do |config|
    # Define environment configuration
    config.ssh.insert_key = false
    config.vm.synced_folder '.', '/vagrant', disabled: true
  
    # Configure VM sizing
    config.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
  
    # Define Ubuntu configuration
    config.vm.define "ubuntu" do |ubuntu|
      ubuntu.vm.box = "generic/ubuntu2004"
      ubuntu.vm.hostname = "ubnt2004.test"
      ubuntu.vm.network :private_network, ip: "192.168.56.5"
    end
  
    # Define RHEL (CentOS) configuration
    config.vm.define "rhel" do |rhel|
      rhel.vm.box = "generic/rocky9"
      rhel.vm.hostname = "rocky9.test"
      rhel.vm.network :private_network, ip: "192.168.56.6"
    end
  end