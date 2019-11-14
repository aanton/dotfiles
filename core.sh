#!/bin/bash

PROJECTDIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
DATETIME=$(date +%Y%m%d%H%M%S)

function update_apt {
  enable_apt_universe_repository

  if [[ -v SKIP_APT_UPDATE && "$SKIP_APT_UPDATE" = true ]]; then
    print_warning "Skipping updating APT"
    return 0
  fi

  print_info "Updating APT repositories ..."
  sudo apt update
}

function enable_apt_universe_repository {
  local -r VERSION=$(lsb_release -a 2>/dev/null | fgrep Codename | cut -f2)

  apt-cache policy | fgrep "$VERSION/universe" &> /dev/null
  if [ $? -ne 0 ]; then
    print_info "Enabling APT universe repository ..."
    sudo add-apt-repository universe
  fi
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

function install_app {
  check_app_installed "$@" && return 0

  local -r TOOL_SCRIPT=${PROJECTDIR}/tools/${1}.sh
  if [ -f "$TOOL_SCRIPT" ]; then
    print_info "Installing manual app: $1 ..."
    . ${TOOL_SCRIPT}
  else
    print_info "Installing APT app: $1 ..."
    sudo apt install -y $1
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
  local -r APP=$1
  ask_for_confirmation "Do you want to install ${APP} ?" "Skipping installing app: ${APP}"
}

function ask_for_configuration {
  local -r TOOL=$1
  ask_for_confirmation "Do you want to configure ${TOOL} ?" "Skipping configuring: ${TOOL}"
}

function ask_for_confirmation {
  local -r QUESTION_MESSAGE=$1
  local -r SKIPPING_MESSAGE=$2

  if [[ -v SKIP_CONFIRMATION && "$SKIP_CONFIRMATION" = true ]]; then
    return 0
  fi

  print_question "${QUESTION_MESSAGE} (y/N)"
  read
  if [[ ! "$REPLY" =~ ^[Yy]$ ]]; then
      print_warning "${SKIPPING_MESSAGE}"
      return 1
  fi

  return 0
}

function print_in_color {
  printf "%b" "$(tput setaf $2)" "$1" "$(tput sgr0)"
}

function print_error {
  print_in_color "$1\n" 1
}

function print_warning {
  print_in_color "$1\n" 3
}

function print_info {
  print_in_color "$1\n" 2
}

function print_question {
  print_in_color "$1 " 3
}
