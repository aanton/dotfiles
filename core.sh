#!/bin/bash

PROJECTDIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
DATETIME=$(date +%Y%m%d%H%M%S)

function check_installed {
  local -r APP=$1
  local -r CHECK=${2:-$1}

  which $CHECK &> /dev/null
  if [ $? -ne 0 ]; then
    echo "Installing: ${APP} ..."
    return 1
  fi

  echo "Already installed: ${APP}"
  return 0
}

function install_apt {
  check_installed "$@"

  if [ $? -ne 0 ]; then
    sudo apt install -y $1
  fi
}

function install_manual {
  check_installed "$@"

  if [ $? -ne 0 ]; then
    . ${PROJECTDIR}/tools/$1.sh
  fi
}
