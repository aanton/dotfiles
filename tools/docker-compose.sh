#!/bin/bash

COMPOSE_VERSION=`git ls-remote https://github.com/docker/compose | grep refs/tags | grep -Po "\d+\.\d+\.\d+$" | sort --version-sort | tail -n1`
sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
