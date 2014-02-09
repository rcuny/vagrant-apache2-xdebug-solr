# Vagrant dev box for PHP: Apache2 + Solr + Xdebug

## Companion repository
This repository is part of a 2 repositories Vagrant project:

* **[This repo](https://github.com/rcuny/vagrant-apache2-xdebug-solr), aim at provisionning your box once.**
* *[A second repo](https://github.com/rcuny/vagrant-drupal-xdebug-solr), using the first one to build a Drupal customized box.*


## What is in this box
This repo contains Vagrant provisionning script to setup a base virtual machine with the following components:

* Ubuntu 12.04 LTS
* apache2 + mysql 5.5.x + PHP 5.3.x
* phpMyAdmin
* [Apache/Lucene Solr 4.x](http://lucene.apache.org/solr/)
* [Xdebug](http://xdebug.org)

The aim is to build this base machine once, then re-use it to make it project-specific (ex: Drupal will require some small changes to the Solr conf).


## Before starting

### Dependencies / Prerequisites

* [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](http://downloads.vagrantup.com/)


### Note to Windows users

NFS will not work on Windows. Keep it disabled in Vagrantfile.


### Important note on security

This repo is for demonstration purposes only and contains some passwords. 
It's stronlgy recommended to not use the resources 'as is' for production or even development environments.

Also know that for developer convenience, some default PHP variable (ex: max memory) have been modified. These modifications may not be suitable for production. See provision.sh for details.



## How to use this Vagrant box

### Creating and provisionning your box

To provision the box, use:

``` bash
mkdir vagrant-apache2-xdebug-solr && cd vagrant-apache2-xdebug-solr
git clone git@github.com:rcuny/vagrant-apache2-xdebug-solr.git ./
vagrant up
```

Note that during the vagrant up command, you may be prompted for a password. This is your host OS asking for your local admin password, to mount network shares from the VM.

Once the provisionning is complete, simply ssh yourself to the VM and run the PhpMyAdmin install script. The provisionning script can't install PhpMyAdmin automatically, as it runs in non-interactive mode, that's why we do it manually.

``` bash
vagrant ssh
/vagrant/scripts/phpmyadmin.sh
```

Nb: the default MySQL password set by provisionning.sh is "root".

You're done! Open a browser and check the following URLs:

* http://192.168.66.6/phpinfo.php - you should see info about Xdebug
* http://192.168.66.6/phpmyadmin - defaults values: user: root / pass: root
* http://192.168.66.6:8080/solr



### Packaging your box for redistribution

The aim of this provisionning script is to get a full LAMP stack ready, with Xdebug and Solr.
Once this is done, you should package the box and save it somewhere online, to use it in your web projects without the hassle of going through the entire provisionning process again.

To package your box:

``` bash
VBoxManage list vms
vagrant package --base build_box_TIMESTAMP --output name_of_my_box.box
```

build_box_TIMESTAMP should be replaced by the ID given by the `VBoxManage list vms` command.

Upload your box to a remote location, then in your next Drupal project, use the following setting:

``` bash
vagrant.vm.box_url = "http://mywebsite.com/name_of_my_box.box"
```

When you are done with storing the box to a remote location, you can proceed to the 2nd repository, [Vagrant dev box for Drupal: Apache2 + Solr + Xdebug](https://github.com/rcuny/vagrant-drupal-xdebug-solr), and learn how to reuse this box for a Drupal project.



## Sources & Thanks

This project is a compilation of many already existing pieces. Thanks to all of the authors for their work.

### Original provisionning box
This provisionning script is based on the first part of the repository used at DrupalCamp Leuven. It was created by [Jurgen Verhasselt](http://wunderkraut.com/people/jurgen-verhasselt) from [Wunderkraut](http://wunderkraut.com).

Many thanks for this highly valueable work!

* [Getting Started With Vagrant](http://wunderkraut.com/blog/drupalcamp-leuven-getting-started-with-vagrant/2013-09-17)
* [Full project repo on Github](https://github.com/sjugge/DCL13_Vagrant)


### Xdebug install script
Xdebug provisionning is based on an article by [Anthony Curreri](http://www.mailbeyond.com).

* [To use PhpStorm with Ubuntu Vagrant install Xdebug for PHP](http://www.mailbeyond.com/phpstorm-vagrant-install-xdebug-php)

### Apache Solr install script
Install Apache Solr provisionning is based on article from [Tomasz Muras](https://twitter.com/zabuch)

* [How to setup solr 4 on tomcat in Ubuntu server 12.04 LTS](http://jmuras.com/blog/2012/setup-solr-4-tomcat-ubuntu-server-12-04-lts/)


### MySQL configuration for Vagrant
Thanks to [mdurao](https://laracasts.com/forum/member/353-mdurao) for is contribution on [this post](https://laracasts.com/forum/215-vagrant-mysql/0)


## Additional resources

* [Vagrant docs](http://docs.vagrantup.com/)


## About the author
[Renaud CUNY](http://renaud-cuny.com) is a Drupal consutant & developer.

