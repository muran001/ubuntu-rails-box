# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu-precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network "private_network", ip: "192.168.33.11"
  # config.vm.network "public_network"
  # config.ssh.forward_agent = true
  config.vm.synced_folder ".", "/vagrant", type: "nfs"
  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = ["./cookbooks", "site-cookbooks"]
    chef.roles_path = "./roles"
    chef.data_bags_path = "./data_bags"
    chef.add_role "rails-development"
  
    # You may also specify custom JSON attributes:
    chef.json = { 
      :mysql => {
          :server_root_password   => '',
          :server_debian_password => '',
          :server_repl_password   => ''
      },
      "rbenv" => {
        "global" => "2.1.1",
        "rubies" => [ "2.1.1" ],
        "gems" => {
          "2.1.1" => [
            { 'name' => 'bundler' }
          ]
        }
      }
    }
  end
end
