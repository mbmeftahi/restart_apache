#!/bin/bash

Test=YeS

Config="$1"
Command="$2"

if [ $# -ne 2 ]
then
    echo "$0 requires at lease two parametere  {virtual-host} {restart|reload}"
    exit 1
    else
    printf "\t Required number of arguments are passed = $# \n "
fi

VHOST_PATH=/etc/apache2/sites-available/
VHOST_Files=/etc/apache2/sites-available/*.conf
# Check if config file passed as parameter one exist.....
#if [ -e /etc/apache2/sites-available/"$Config" ]; then
if [ -e "$VHOST_PATH$Config" ]; then
     printf "\t Config File exists. \n"
else
    printf "\t Provide File does not exist \n"
    printf "\t Config Files are below: \n "
    for fileName in $VHOST_Files
    do
        printf "\t $fileName \n"
        fileOnly=$(basename $fileName)
        printf "\t\t $fileOnly \n"
        [ "$Test" == "Yes" ] && ( printf "\t echo for testing  $fileName \n")
    done
    exit 1
fi

echo " passed the file check"
exit 0


if [ "$Command" == "restart" ] || [ "$Command" == "reload" ]
then
  # move to this directory  /etc/apache2/sites-available
    cd /etc/apache2/sites-available
# disable the vhost
    sudo a2dissite "$Config"
    sudo service apache2 "$Command"
# enable
    sudo a2ensite "$Config"
    sudo service apache2 "$Command"
else
    printf "\t ERROR: $Command is not valid service command\n"
    printf "\t Did not pass the correct  argument for web server startup \n\t Options are restart or reload \n "
    exit 1 
fi

echo "END"
exit 0

