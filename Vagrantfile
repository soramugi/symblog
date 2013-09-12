# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
    config.vm.box = "centos64"
    config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box"
    config.vm.network :hostonly, "192.168.33.100"
    config.vm.forward_port 80, 8082

    config.vm.provision :chef_solo do |chef|

        chef.cookbooks_path = ["cookbooks", "site-cookbooks"]

        chef.add_recipe "yum::epel"
        chef.add_recipe "yum::ius"
        chef.add_recipe "yum::remi"
        chef.add_recipe "symfony2"
        chef.add_recipe "mysql::server"
        chef.json = {
            "mysql" => {
            "server_root_password" => "",
            "server_repl_password" => "",
            "server_debian_password" => ""
        }
        }
    end

    config.vm.customize [
        "modifyvm", :id,
        "--memory","1024",
        "--name","symblog-sandbox-"
    ]
end
