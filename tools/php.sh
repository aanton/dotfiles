#!/bin/bash

sudo add-apt-repository ppa:ondrej/php -y

print_info "Installing php8.0 ..."
sudo apt install -y php8.0-cli php8.0-common

print_info "Installing php8.0 extensions ..."
sudo apt install -y php8.0-curl php8.0-mbstring php8.0-mysql php8.0-opcache php8.0-readline php8.0-sqlite3 php8.0-xml php8.0-soap
