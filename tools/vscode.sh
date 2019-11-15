#!/bin/bash

. ${PROJECTDIR}/commands/install_vscode_extensions.sh
. ${PROJECTDIR}/commands/create_symlinks.sh

function install_vscode {
  curl -L https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -o /tmp/vscode.deb
  sudo dpkg -i /tmp/vscode.deb
  rm /tmp/vscode.deb
}

install_vscode
create_vscode_symlinks
install_vscode_extensions
