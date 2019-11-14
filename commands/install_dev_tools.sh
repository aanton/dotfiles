#!/bin/bash

#### COMMAND ###################################################################

function install_dev_tools {
  install_app shellcheck

  ask_for_installation docker && install_app docker
  ask_for_installation docker-compose && install_app docker-compose
  ask_for_installation "php & php extensions" && install_app php
  ask_for_installation composer && install_app composer
  ask_for_installation node && install_app node
}
