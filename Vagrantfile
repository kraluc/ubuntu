# Vagrant crash course:
# https://www.youtube.com/watch?v=vBreXjkizgo

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Box Settings
  config.vm.box = "ubuntu/focal64"

  # Provider Settings
  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 4
  end

  # Network Settings
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"

  # Folder Settings  1st is your host folder  2nd is the guest folder.
  # NFS mount - see Vagrant doc: https://www.vagrantup.com/docs/synced-folders/nfs
  # macOS; ensure /sbin/nfsd has full disk access privileges (preferences> privacy)
  config.vm.synced_folder ".", "/var/www/html", :nfs => { :mount_options => ["dmode=777", "fmode=666"] }

  # Provision Settings
  # config.vm.provision "shell", inline: <<-SHELL
  #    apt-get update
  #    apt-get install -y apache2
  # SHELL

  config.vm.provision "shell", path: "bootstrap.sh"
end
