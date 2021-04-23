#!/bin/bash

#### COMMAND ###################################################################

function install_dev_tools {
  install_app shellcheck

  install_app_with_confirmation docker
  install_app_with_confirmation docker-compose
  install_app_with_confirmation php
  install_app_with_confirmation composer
  install_app_with_confirmation node

  install_npm_package_with_confirmation browser-sync
  install_npm_package_with_confirmation prettier
  install_npm_package_with_confirmation surge
}
