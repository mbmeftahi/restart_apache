#!/bin/bash

Config="$1"
Command="$2"


if [ $# -ne 2 ] ; then
    echo "$0 requires at lease two parametere  {virtual-host} {restart|reload}"
    exit 1
fi

if [ "$Command" != "restart" ] || [ "$Command" != "reload" ] ; then
    printf "\n\t Did not pass the correct  argument for web server startup \n\t Options are restart or reload \n\n "
    exit 1   
else
echo "moving on with restart"
# move to this directory  /etc/apache2/sites-available
    cd /etc/apache2/sites-available
# disable the vhost
    sudo a2dissite "$Config"
    sudo service apache2 "$Command"
# enable
    sudo a2ensite "$Config"
    sudo service apache2 "$Command"
fi
echo "END"
exit 0

