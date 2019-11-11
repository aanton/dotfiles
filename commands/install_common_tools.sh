#!/bin/bash

#### AUXILIARY FUNCTIONS #######################################################

function install_ohmyzsh {
  if [[ -d $HOME/.oh-my-zsh ]]; then
    print_info "App already installed: oh-my-zsh"
    return
  fi

  print_info "Installing: oh-my-zsh ..."
  git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"
}

#### COMMAND ###################################################################

function install_common_tools {
  install_ohmyzsh

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
}
