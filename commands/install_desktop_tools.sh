#!/bin/bash

#### COMMAND ###################################################################

function install_desktop_tools {
  if [[ -v SKIP_DESKTOP_TOOLS && "$SKIP_DESKTOP_TOOLS" = true ]]; then
    print_warning "Skipping installation of the desktop tools"
    return 0
  fi

  install_app meld
  install_app diodon
  install_app google-chrome
  install_app vscode code
  install_app_with_confirmation filezilla
  install_app_with_confirmation postman
  install_app_with_confirmation spideroak-one SpiderOakONE
}
