#!/bin/bash

#### COMMAND ###################################################################

function install_desktop_tools {
  if [[ -v SKIP_DESKTOP_TOOLS && "$SKIP_DESKTOP_TOOLS" = true ]]; then
    print_warning "Skipping installation of the desktop tools"
    return 0
  fi

  install_app meld
  install_app clipit
  install_app google-chrome
  install_app vscode code

  print_info "Installing optional desktop tools ..."
  ask_for_installation byzanz && install_app byzanz byzanz-record
  ask_for_installation filezilla && install_app filezilla
}
