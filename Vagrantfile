# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'

  config.vm.provider 'virtualbox' do |v|
    v.memory = 1024
    v.cpus = 2
  end

  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.scope = :box
  end

  config.vm.provision 'chef_solo' do |chef|
    chef.add_recipe 'zombodb::elasticsearch'
    chef.add_recipe 'zombodb::postgresql'
    chef.add_recipe 'zombodb::postgresql_extension'
  end
end
