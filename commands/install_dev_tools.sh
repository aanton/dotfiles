#!/bin/bash

#### AUXILIARY FUNCTIONS #######################################################

function install_npm_package {
  local -r PACKAGE=$1
  local -r ASK=${2:-"true"}

  if [[ ! $(which npm) ]]; then
    print_warning "Package ${PACKAGE} can NOT be installed because npm is missing"
    return 1
  fi

  if [[ $(npm list -g --depth=0 | fgrep " ${PACKAGE}@") ]]; then
    print_info "Package already installed: ${PACKAGE}"
    return 0
  fi

  if [[ "${ASK}" == "true" ]]; then
    ask_for_installation ${PACKAGE} || return 1
  fi

  print_info "Installing package: ${PACKAGE} ..."
  sudo npm install -g ${PACKAGE}
}

#### COMMAND ###################################################################

function install_dev_tools {
  install_app shellcheck

  install_app_with_confirmation docker
  install_app_with_confirmation docker-compose
  install_app_with_confirmation php
  install_app_with_confirmation composer
  install_app_with_confirmation node
}
