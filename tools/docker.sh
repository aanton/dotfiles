#!/bin/bash

curl -fsSL https://get.docker.com -o /tmp/docker.sh
sh /tmp/docker.sh
/tmp/docker.sh

# Executing docker without sudo (logout is required)
sudo usermod -aG docker ${USER}
