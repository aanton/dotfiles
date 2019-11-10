#!/bin/bash

sudo apt install -y php-cli php-common

echo "Installing php extensions..."
sudo apt install -y php-curl php-json php-mbstring php-mysql php-opcache php-readline php-sqlite3 php-xml
