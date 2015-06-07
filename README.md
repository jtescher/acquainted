# Acquainted

[![Build Status](https://travis-ci.org/jtescher/acquainted.svg)](https://travis-ci.org/jtescher/acquainted)

## Prerequisites

First install [Vagrant](https://www.vagrantup.com/), [ChefDK](https://downloads.chef.io/chef-dk), and 
[Vagrant Berkshelf](https://github.com/berkshelf/vagrant-berkshelf)

Then create your VM

```sh
$ vagrant up
```

## Running / Development

```sh
$ vagrant ssh
$ cd /vagrant/
$ mix deps.get
$ mix ecto.create
$ mix ecto.migrate
$ mix phoenix.server
```

Now you can visit `localhost:4000` from your browser.
