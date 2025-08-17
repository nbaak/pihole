#!/bin/bash

# Create directory if it doesn't exist
mkdir -p /etc/nginx/ssl
cd /etc/nginx/ssl || exit 1

# Check if certificates already exist
if [[ -f "pihole.crt" || -f "pihole.key" ]]; then
    echo "Certificates already exist. Skipping creation."
    exit 0
fi

# Generate certificate (10,000 days)
openssl req -new -x509 -days 36500 -nodes \
  -out pihole.crt \
  -keyout pihole.key

# Set permissions
chmod 644 pihole.crt
chmod 600 pihole.key

echo "Certificates created in /etc/nginx/ssl/"
