#!/bin/bash

. ${PROJECTDIR}/commands/create_symlinks.sh

function install_clipit {
  sudo apt install clipit
}

install_clipit
create_clipit_symlinks
