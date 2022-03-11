# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV["VAGRANT_EXPERIMENTAL"] = "typed_triggers"

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "amarcireau/macos"
  config.vm.box_version = "11.3.1"

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider "virtualbox" do |v|
    v.check_guest_additions = false
  end

  config.vm.boot_timeout = 3600

  config.vm.hostname = "development-box-osx"

  config.vm.provision "shell", path: 'prepare.sh', privileged: false

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end

  config.trigger.after :"VagrantPlugins::ProviderVirtualBox::Action::Import", type: :action do |t|
    t.ruby do |env, machine|
      FileUtils.cp(
        machine.box.directory.join("include").join("macOS.nvram").to_s,
        machine.provider.driver.execute_command(["showvminfo", machine.id, "--machinereadable"]).
        split(/\n/).
        map {|line| line.partition(/=/)}.
        select {|partition| partition.first == "BIOS NVRAM File"}.
        last.
        last[1..-2]
      )
    end
  end

  config.vm.provider :virtualbox do |vb|
    vb.cpus = 2
    vb.memory = 4096
    vb.customize ["modifyvm", :id, "--usbxhci", "off"]
  end
end
