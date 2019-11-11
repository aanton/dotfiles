#!/bin/bash

. ${PROJECTDIR}/commands/install_vscode_extensions.sh

function install_vscode {
  curl -L https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -o /tmp/vscode.deb
  sudo dpkg -i /tmp/vscode.deb
  rm /tmp/vscode.deb
}

function create_vscode_symlinks {
  create_symlink vscode/settings.json .config/Code/User/settings.json
  create_symlink vscode/keybindings.json .config/Code/User/keybindings.json
  create_symlink vscode/snippets .config/Code/User/snippets
}

install_vscode
create_vscode_symlinks
install_vscode_extensions
