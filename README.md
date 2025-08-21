# Pi Hole
To install Pihole you need to install nginx and docker compose. Then create cert files for nginx to run it on ssl.

## Requirements
This re	quires Docker and NGinx to be installed.

```bash
# Nginx
sudo apt install -y nginx

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
```

## Installation
Expecting you have installed docker with docker compose and nginx.

1. navigate to nginx `cd nginx`
2. run the install script `./install.sh`

## Login into PiHole
Before you can loin to your pihole you have to set a pihole password.

```bash
./setpassword <password>
```