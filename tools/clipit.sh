#!/bin/bash

. ${PROJECTDIR}/commands/create_symlinks.sh

sudo add-apt-repository ppa:afelinczak/ppa -y
sudo apt update

sudo apt-get install -y clipit
create_clipit_symlinks
