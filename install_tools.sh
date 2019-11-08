#!/bin/bash

. `dirname $0`/core.sh

function install_ohmyzsh {
  if [[ -d $HOME/.oh-my-zsh ]]; then
    echo "App already installed: oh-my-zsh"
    return
  fi

  echo "Installing: oh-my-zsh..."
  git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"
}

sudo apt update

install_apt curl
install_apt git
install_apt htop
install_apt httpie http
install_apt jq
install_apt tree
install_apt vim

install_manual fd
install_manual fzf
install_manual ripgrep rg

install_ohmyzsh
