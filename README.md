# envnx
##### A fairly simple but complete LEMP development environment.

envnx is a complete development environment for devs who work on multiple projects at the same time. Like, you know, people working at agencies.

It is based on [PuPHPet](https://puphpet.com), with a few adjustments.

envnx is configured to run on `192.168.56.102`

> **NOTE**

>Resources for this box are set to an optimized amount (for me at least) of 4GB of RAM and 4 CPU's. This may very well be too much for your machine so please double check.

> Edit /vagrant/puphpet/config.yaml to change this (before upping the box).


## Box includes:
* puphpet/ubuntu1404-x64
* nginx
* php-fpm
* mysql
* elasticsearch (port 9200)
* npm
* mailcatcher (running at http://192.168.56.102:1080)
* redis (port 6379)
* wpcli
* xdebug
* vim
* htop
* postfix
* curl
* git

## How to use
If you're not familiar with Vagrant, [please check their documentation](http://docs.vagrantup.com/v2/getting-started/).

Assuming you are familiar with Vagrant, and have VirtualBox running:

1. Download this project to folder where you want envnx to live on your machine
2. Open your terminal and move into the folder
3. Within this folder, create a `www` folder. This will hold your projects.
  > envnx will automatically sync this folder as the `/var/www/` within the box. You can also create `www` as a symlink to an existing folder on your host machine. I like to use the `~/Sites` folder in OS X.

4. Install the vagrant-bindfs plugin:

    ```
  $ vagrant plugin install vagrant-bindfs
    ```
  > Vagrant can use multiple techniques to sync files between your host machine and the box. NFS is fastest, but it needs this plugin.

5. Move into the `vagrant` folder and start it up:

    ```
  $ vagrant up
    ```

   The first time this will take a while. So go grab a coffee, or call your mom.

6. That's it, the box should now be running on `192.168.56.102`. Time to add some vhosts.


## Managing vhosts
A small tool has been added to easily manage virtualhosts. This script, originally by [RoverWire]("https://github.com/RoverWire/virtualhost/blob/master/virtualhost-nginx.sh", "virtualhost-nginx.sh by RoverWire"), has been slightly adjusted to work well in a Vagrant box.

#### Usage

(when in the box)

*Add a vhost:*

```
$ vhost create [domain] [optional host_dir]

```

*Delete a vhost:*

```
$ vhost delete [domain] [optional host_dir]
```

Omitting the `host_dir` argument will use `domain` as the name of the webroot folder: `/var/www/<domain>`.

Note that the script will check if the given directory exist and won't overwrite it.

#### Examples

*Add a vhost loc.superinteractive.com:*

```
$ vhost create loc.superinteractive.com
```

*Delete vhost loc.superinteractive.com:*

```
$ vhost delete loc.superinteractive.com
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

## Connecting to MySQL

* MySQL Host: 127.0.0.1
* Username: root
* Password: skyhigh3
* SSH Host: 192.168.56.102
* SSH User: vagrant
* SSH Key: ./vagrant/puphpet/files/dot/ssh/id_rsa

Sometimes Sequel Pro will keep asking for a password while connecting, even though you're using the key file. This has to do with a permission issue. To solve it change the key permissions to 400:

```
chmod 400 ./vagrant/puphpet/files/dot/ssh/id_rsa
```




