# ubuntu-rails-box

## Introduction

This project automates the setup of a development environment for working on Ruby on Rails itself.

This project uses Berkshelf to get cookbooks.

Reference Repositories
* [rails-dev-box](https://github.com/rails/rails-dev-box)
* [chef-rails-dev-box](https://github.com/banyan/chef-rails-dev-box)

Please note this virtual machine is not designed to be used for Rails application development.

## Requirements

* [VirtualBox](https://www.virtualbox.org)
* [Vagrant 1.1+](http://vagrantup.com) (not a Ruby gem)
* Chef
* Knife-solo
* Berkshelf

## How To Build The Virtual Machine

Building the virtual machine is this easy:

    host $ git clone https://github.com/muran001/ubuntu-rails-box.git
    host $ cd ubuntu-rails-box
    host $ berks install --path cookbooks/
    host $ vagrant up

Provisioning is below:

    host $ vagrant ssh-config --host development >> ~/.ssh/config
    host $ knife solo cook vagrant@192.168.33.11

That's it.

(If you want to use VMWare Fusion instead of VirtualBox, write `vagrant up --provider=vmware_fusion` instead of `vagrant up` when building the VM for the first time. After that, Vagrant will remember your provider choice, and you won't need to include the `provider` flag again.)

If the base box is not present that command fetches it first. The setup itself takes about 3 minutes in my MacBook Air. After the installation has finished, you can access the virtual machine with

    host $ vagrant ssh
    Welcome to Ubuntu 12.04 LTS (GNU/Linux 3.2.0-23-generic-pae i686)
    ...
    vagrant@ubuntu-rails-box:~$

Port 3000 in the host computer is forwarded to port 3000 in the virtual machine. Thus, applications running in the virtual machine can be accessed via localhost:3000 in the host computer.

## What's In The Box

* vim

* Git

* rbenv

* Ruby 2.1.1

* SQLite3, MySQL

* Node.js for the asset pipeline

* Memcached

## Recommended Workflow

The recommended workflow is

* edit in the host computer and

* test within the virtual machine.

Just clone your Rails fork into the rails-dev-box directory on the host computer:

    host $ cd ubuntu-rails-box
    host $ git clone git@github.com:<your username>/rails.git

Vagrant mounts that directory as _/vagrant_ within the virtual machine:

    vagrant@ubuntu-rails-box:~$ ls /vagrant
    Berksfile      README.md      cookbooks      environments   roles
    Berksfile.lock Vagrantfile    data_bags      nodes          site-cookbooks
    rails

Install gem dependencies in there:

    vagrant@ubuntu-rails-box:~$ cd /vagrant/rails
    vagrant@ubuntu-rails-box:/vagrant/rails$ bundle

We are ready to go to edit in the host, and test in the virtual machine.

This workflow is convenient because in the host computer you normally have your editor of choice fine-tuned, Git configured, and SSH keys in place.

## Virtual Machine Management

When done just log out with `^D` and suspend the virtual machine

    host $ vagrant suspend

then, resume to hack again

    host $ vagrant resume

Run

    host $ vagrant halt

to shutdown the virtual machine, and

    host $ vagrant up

to boot it again.

You can find out the state of a virtual machine anytime by invoking

    host $ vagrant status

Finally, to completely wipe the virtual machine from the disk **destroying all its contents**:

    host $ vagrant destroy # DANGER: all is gone

Please check the [Vagrant documentation](http://docs.vagrantup.com/v2/) for more information on Vagrant.

