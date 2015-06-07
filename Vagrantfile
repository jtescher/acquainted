# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Use ubuntu base
  config.vm.box = "ubuntu/trusty64"

  # Forward phoenix port
  config.vm.network "forwarded_port", guest: 4000, host: 4000

  # Configure chef recipes
  config.vm.provision :chef_zero do |chef|
    chef.json = {
      'postgresql' => {
        'username' => 'postgres',
        'password' => 'postgres'
      }
    }
    chef.run_list = [
      "recipe[elixir::default]",
      "recipe[postgresql::server]"
    ]
  end

end
