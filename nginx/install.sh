#!/bin/bash

# INSTALL script to be run as root

# check if running as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# copy nginx config
cp pihole.conf /etc/nginx/sites-available/

# create symlink in sites-enabled if it doesn't exist
if [[ ! -f /etc/nginx/sites-enabled/pihole.conf ]]; then
    ln -s /etc/nginx/sites-available/pihole.conf /etc/nginx/sites-enabled/
fi

# run the SSL certificate creation script
if [[ -x "./create_certs.sh" ]]; then
    ./create_certs.sh
else
    echo "create_certs.sh not found or not executable"
    exit 1
fi

echo "Installation complete."
