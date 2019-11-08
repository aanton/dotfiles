#!/bin/bash

function create_vscode_symlinks {
  create_symlink vscode/settings.json .config/Code/User/settings.json
  create_symlink vscode/keybindings.json .config/Code/User/keybindings.json
  create_symlink vscode/snippets .config/Code/User/snippets
}

curl -L https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -o /tmp/vscode.deb
sudo dpkg -i /tmp/vscode.deb
rm /tmp/vscode.deb

create_vscode_symlinks
