#!/bin/bash
clear

echo "------------------------------------"
echo "Creating vhost command for nginx..."
echo "------------------------------------"

sudo cp /vagrant/virtualhost.sh /usr/bin/vhost

sudo chmod -x /usr/bin/vhost

echo "Done."
