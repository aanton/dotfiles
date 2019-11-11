#!/bin/bash

#### COMMAND ###################################################################

function install_desktop_tools {
  install_apt meld
  install_manual clipit
  install_manual google-chrome
  install_manual vscode code

  print_info "Installing optional desktop tools ..."
  ask_for_installation filezilla && install_apt filezilla
}
