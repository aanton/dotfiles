#!/bin/bash

. ${PROJECTDIR}/commands/install_vscode_extensions.sh
. ${PROJECTDIR}/commands/create_symlinks.sh

function install_vscode {
  curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -o /tmp/vscode.deb
  sudo dpkg -i /tmp/vscode.deb
  rm /tmp/vscode.deb
}

install_vscode
create_vscode_symlinks
install_vscode_extensions
