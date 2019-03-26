#!/bin/bash

# move to this directory  /etc/apache2/sites-available
cd /etc/apache2/sites-available

# disable the vhost
sudo a2dissite *
sudo service apache2 restart

# enable
sudo a2ensite *
sudo service apache2 restart

