#!/bin/bash

#### COMMAND ###################################################################

function install_dev_tools {
  print_info "Installing optional development tools ..."

  ask_for_installation docker && install_manual docker
  ask_for_installation docker-compose && install_manual docker-compose
  ask_for_installation "php & php extensions" && install_manual php
  ask_for_installation composer && install_manual composer
  ask_for_installation node && install_manual node
}
