#!/bin/bash

#### COMMAND ###################################################################

function install_dev_tools {
  install_app shellcheck

  install_app_with_confimation docker
  install_app_with_confimation docker-compose
  install_app_with_confimation php
  install_app_with_confimation composer
  install_app_with_confimation node
}
