#!/bin/bash

. `dirname $0`/core.sh

function apt_update {
  sudo apt update
}

function apt_upgrade {
  sudo apt upgrade -y
}

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

function install_zsh {
  install_apt zsh

  if [[ ! "$SHELL" == "$(which zsh)" ]]; then
    echo "Setting ZSH as the default shell"
    chsh -s "$(which zsh)"
  fi

  if [[ ! -d $HOME/.oh-my-zsh/ ]]; then
    echo "Installing: Oh-my-zsh ..."
    git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"
  fi
}

apt_update

install_apt curl
install_apt git
install_apt htop
install_apt httpie http
install_apt jq
install_apt tree
install_apt vim
install_manual fd
install_manual ripgrep rg
install_zsh

apt_upgrade
