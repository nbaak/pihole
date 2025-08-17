#!/bin/bash

# check if password is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <new_password>"
    echo "Or use: $0 -p  (to be prompted securely)"
    exit 1
fi

# prompt mode
if [ "$1" = "-p" ]; then
    read -rsp "Enter new Pi-hole password: " PASSWORD
    echo
else
    PASSWORD="$1"
fi

# set password inside the Pi-hole container
docker compose exec pihole pihole setpassword "$PASSWORD"

