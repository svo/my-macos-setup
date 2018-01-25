# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

unless Vagrant.has_plugin?("vagrant-cachier")
  puts "Install vagrant-cachier"
  exec 'vagrant plugin install vagrant-cachier && vagrant up'
end

unless Vagrant.has_plugin?("vagrant-vbguest")
  puts "Install vagrant-vbguest"
  exec 'vagrant plugin install vagrant-vbguest && vagrant up'
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "emil-appunite/macos10.13-xcode9.1"

  config.vm.hostname = "development-box-osx"

  config.cache.scope = :machine

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
  end
end
