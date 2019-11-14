#!/bin/bash

#### COMMAND ###################################################################

function install_desktop_tools {
  if [[ -v SKIP_DESKTOP_TOOLS && "$SKIP_DESKTOP_TOOLS" = true ]]; then
    print_warning "Skipping installation of the desktop tools"
    return 0
  fi

  install_apt meld
  install_manual clipit
  install_manual google-chrome
  install_manual vscode code

  print_info "Installing optional desktop tools ..."
  ask_for_installation byzanz && install_apt byzanz byzanz-record
  ask_for_installation filezilla && install_apt filezilla
}
