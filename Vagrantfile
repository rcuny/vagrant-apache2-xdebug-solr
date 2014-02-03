# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  ## Configuration

  # Virtualbox tweaks. See http://docs.vagrantup.com/v2/virtualbox/configuration.html
  config.vm.provider :virtualbox do |vb|
    # Moar memory
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end


  ##  Network shares.   
  
  # UNIX users can use the nfs switch
  config.vm.synced_folder "www", "/var/www", :nfs => true
  config.vm.synced_folder "scripts", "/home/vagrant/scripts", :nfs => true
  
  # Windows users SHOULD default to the following settings - See http://docs.vagrantup.com/v2/synced-folders/nfs.html
  # config.vm.synced_folder "www", "/var/www"
  # config.vm.synced_folder "scripts", "/home/vagrant/scripts"
  

  ## Provision

  # scripts/provision.sh will provision the box
  # comment out when using a re-packaged box 
  config.vm.provision :shell, :inline => "
    sh /vagrant/scripts/provision.sh;
  "


  ## The Vagrant Box

  # Defines the Vagrant box name, download URL, IP and hostname
  config.vm.define :vagrant do |vagrant|
    vagrant.vm.box = "precise64"
    vagrant.vm.box_url = "http://files.vagrantup.com/precise64.box"
    vagrant.vm.network :private_network, ip: "192.168.66.6"
    vagrant.vm.hostname = "vagrant.dcl"
  end
end
