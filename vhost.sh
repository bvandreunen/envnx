#!/bin/bash
#
# Usage: $ ./vhost.sh loc.sitename.com
#

# No need for sudo in vagrant/puphpet setup
#sudo -v

echo "Creating a vhost for $1"
sudo cp /etc/apache2/sites-available/template.conf /etc/apache2/sites-available/$1.conf
sudo sed -i 's/%template%/'$1'/g' /etc/apache2/sites-available/$1.conf

echo "Creating subdomain vhost for static HTML site"
sudo cp /etc/apache2/sites-available/template-html.conf /etc/apache2/sites-available/html.$1.conf
sudo sed -i 's/%template%/html.'$1'/g' /etc/apache2/sites-available/html.$1.conf

sudo a2ensite $1.conf
sudo a2ensite html.$1.conf
sudo service apache2 reload

echo "Done: vhosts for http://$1 and http://html.$1 configured."
