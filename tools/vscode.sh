#!/bin/bash

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

function install_vscode_extension {
  code --install-extension $1 --force
}

install_vscode

create_vscode_symlinks

install_vscode_extension bierner.emojisense
install_vscode_extension bmewburn.vscode-intelephense-client
install_vscode_extension dakara.transformer
install_vscode_extension eamodio.gitlens
install_vscode_extension HookyQR.beautify
install_vscode_extension ms-azuretools.vscode-docker
install_vscode_extension oderwat.indent-rainbow
install_vscode_extension richie5um2.vscode-sort-json
install_vscode_extension ryu1kn.partial-diff
install_vscode_extension sleistner.vscode-fileutils
install_vscode_extension softwareape.numbermonger
install_vscode_extension Tyriar.lorem-ipsum
install_vscode_extension zhuangtongfa.Material-theme
