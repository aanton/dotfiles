#!/bin/bash

PROJECTDIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
DATETIME=$(date +%Y%m%d%H%M%S)

function update_apt {
  if [[ -v DISABLE_APT_UPDATE && "$DISABLE_APT_UPDATE" = true ]]; then
    return 0
  fi

  sudo apt update
}

function check_app_installed {
  local -r APP=$1
  local -r CHECK=${2:-$1}

  which $CHECK &> /dev/null
  if [ $? -ne 0 ]; then
    print_info "App NOT found: ${APP}"
    return 1
  fi

  print_info "App already installed: ${APP}"
  return 0
}

function install_apt {
  check_app_installed "$@"

  if [ $? -ne 0 ]; then
    print_info "Installing APT app: $1 ..."
    sudo apt install -y $1
  fi
}

function install_manual {
  check_app_installed "$@"

  if [ $? -ne 0 ]; then
    print_info "Installing manual app: $1 ..."
    . ${PROJECTDIR}/tools/$1.sh
  fi
}

function create_symlink {
  local -r SOURCE="${PROJECTDIR}/symlinks/${1}"
  local -r DESTINATION="${HOME}/${2:-$1}"

  if [ -h ${DESTINATION} ]; then
    print_info "Removing existing symlink: ${DESTINATION}"
    rm ${DESTINATION}

  elif [ -f "${DESTINATION}" ]; then
    print_info "Backing up existing file: ${DESTINATION}"
    mv ${DESTINATION}{,.${DATETIME}}

  elif [ -d "${DESTINATION}" ]; then
    print_info "Backing up existing directory: ${DESTINATION}"
    mv ${DESTINATION}{,.${DATETIME}}
  fi

  print_info "Creating new symlink: ${DESTINATION}"
  ln -s ${SOURCE} ${DESTINATION}
}

function ask_for_installation {
  if [[ -v FORCE_INSTALLATION && "$FORCE_INSTALLATION" = true ]]; then
    return 0
  fi

  print_question "Do you want to install $1 ? (y/n)"
  read
  [[ "$REPLY" =~ ^[Yy]$ ]] && return 0 || return 1
}

function print_in_color {
  printf "%b" "$(tput setaf $2)" "$1" "$(tput sgr0)"
}

function print_info {
  print_in_color "$1\n" 2
}

function print_question {
  print_in_color "$1 " 3
}
