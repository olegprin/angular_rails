# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

require 'yaml'
configs = YAML.load_file('config.yaml')


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = 'geerlingguy/ubuntu1404'
  config.vm.boot_timeout = 600 
 
  config.vm.provider :virtualbox do |v| 
    v.customize ['modifyvm', :id, '--groups', '/rails']
    v.destroy_unused_network_interfaces = true
    v.memory = configs['memory']
    v.cpus = configs['cpu']
  end 

  config.vm.define 'app1' do |app|
    app.vm.hostname = 'app1'
    app.vm.network 'private_network', ip: configs['ip']

    app.vm.provider :virtualbox do |v| 
      v.name = 'app1'
    end 

    app.vm.synced_folder configs['system_synced_folder']['local'], configs['system_synced_folder']['remote']
    app.vm.synced_folder configs['app_synced_folder']['local'], configs['app_synced_folder']['remote']

    config.vm.provision :shell, path: configs['provision_script'], privileged: false
  end

end
