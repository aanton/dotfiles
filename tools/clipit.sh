#!/bin/bash

. ${PROJECTDIR}/commands/create_symlinks.sh

sudo apt-get install -y clipit
create_clipit_symlinks
