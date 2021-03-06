# envnx
##### An easy to install multi-project LEMP development environment running on vagrant.

envnx is the vagrant solution for devs who work on multiple projects at the same time. Like, you know, people working at [agencies](http://www.superinteractive.com).

I created this to have a stable, portable and complete dev environment. It is based on [PuPHPet](https://puphpet.com), with a few adjustments and additions to make life easier.
Check below to see an overview of [what's in the box](#whats-in-the-box).

envnx is configured to run on `192.168.56.102`

## How to use

Assuming you are familiar with [Vagrant](http://docs.vagrantup.com/v2/getting-started/), and have [VirtualBox](https://www.virtualbox.org/wiki/Downloads) running:

1. Open your terminal and move into the folder where you want envnx to live on your machine.
2. Run this command to download and install envnx:

	```
	curl -s -o install.sh -L https://raw.githubusercontent.com/bvandreunen/envnx_install/master/install.sh && sh install.sh
	```

3. That's it! If you've chosen to start up the box it should now be running on `192.168.56.102`. Time to add some vhosts.

## Managing vhosts

A small tool has been added to easily manage virtualhosts. This script, originally by [RoverWire](https://github.com/RoverWire/virtualhost/blob/master/virtualhost-nginx.sh), has been slightly adjusted to work well in a Vagrant box.

#### Usage

Go into the box to use this tool:

```
cd vagrant
vagrant ssh
```

*Add a vhost:*

```
vhost create [domain] [optional host_dir]
```

*Delete a vhost:*

```
vhost delete [domain] [optional host_dir]
```

Omitting the `host_dir` argument will use `domain` as the name of the webroot folder: `/var/www/<domain>`.

Note that the script will check if the given directory exist and won't overwrite it.

#### Examples

*Add a vhost loc.superinteractive.com:*

```
vhost create loc.superinteractive.com
```

*Delete vhost loc.superinteractive.com:*

```
vhost delete loc.superinteractive.com
```

You could use anything as domain, but a clear and address-bar-autocomplete-friendly practice is to prepend your domain with "loc.", like `loc.superinteractive.com`.

Don't forget to add your domain name to the hosts file on your host machine. Edit `/etc/hosts` and add a line anywhere in the file:

```
192.168.56.102 <domain>
```

Example:

```
192.168.56.102 loc.superinteractive.com
```


## What's in the box?
* puphpet/ubuntu1404-x64
* nginx
* php5-fpm (php 5.6 + mcrypt, gd, curl, xdebug)
* mysql
* elasticsearch (port 9200)
* npm
* mailcatcher (running at http://192.168.56.102:1080)
* redis (port 6379)
* wp-cli
* vim
* htop
* postfix
* xdebug
* git
* virtualhost-nginx.sh for [managing vhosts](#managing-vhosts)

> **NOTE**

>Resources for this box are set to an optimized amount (for me at least) of 4GB of RAM and 4 CPU's. This may very well be too much for your machine so please double check.

> Edit /vagrant/puphpet/config.yaml to change this.


## Connecting to MySQL

You should use [Sequel Pro](http://www.sequelpro.com), it's great.

* MySQL Host: 127.0.0.1
* Username: root
* Password: skyhigh3
* SSH Host: 192.168.56.102
* SSH User: vagrant
* SSH Key: ./vagrant/puphpet/files/dot/ssh/id_rsa

Sometimes Sequel Pro will keep asking for a password while connecting, even though you are using the key file. This has to do with a permission issue. To solve it change the key permissions to 400:

```
chmod 400 ./vagrant/puphpet/files/dot/ssh/id_rsa
```




