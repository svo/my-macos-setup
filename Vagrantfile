# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

unless Vagrant.has_plugin?("vagrant-cachier")
  puts "Install vagrant-cachier"
  exec 'vagrant plugin install vagrant-cachier && vagrant up'
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "LoganAvatar/macOS-10.14"

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.boot_timeout = 3600

  config.vm.hostname = "development-box-osx"

  config.vm.provision "shell", path: 'prepare.sh', privileged: false

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end

  config.vm.provider :virtualbox do |vb|
    vb.cpus = 2
    vb.memory = 4096
  end
end
