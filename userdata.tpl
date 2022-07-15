#!/bin/bash
sudo apt update -y &&
sudo apt install -y nginx
echo "Hello Onyinye from $(hostname -f)" > /var/www/html/index.html