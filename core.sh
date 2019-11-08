#!/bin/bash

PROJECTDIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
DATETIME=$(date +%Y%m%d%H%M%S)

function check_app_installed {
  local -r APP=$1
  local -r CHECK=${2:-$1}

  which $CHECK &> /dev/null
  if [ $? -ne 0 ]; then
    echo "App NOT found: ${APP}"
    return 1
  fi

  echo "App already installed: ${APP}"
  return 0
}

function install_apt {
  check_app_installed "$@"

  if [ $? -ne 0 ]; then
    echo "Installing APT app: $1 ..."
    sudo apt install -y $1
  fi
}

function install_manual {
  check_app_installed "$@"

  if [ $? -ne 0 ]; then
    echo "Installing manual app: $1 ..."
    . ${PROJECTDIR}/tools/$1.sh
  fi
}
