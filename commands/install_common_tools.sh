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

function install_z {
  if [[ -f $HOME/z.sh ]]; then
    print_info "App already installed: Z"
    return
  fi

  print_info "Installing: Z ..."
  curl -fsSL https://raw.githubusercontent.com/rupa/z/master/z.sh -o ~/z.sh
}

#### COMMAND ###################################################################

function install_common_tools {
  install_ohmyzsh
  install_z

  install_app curl
  install_app git
  install_app htop
  install_app httpie http
  install_app jq
  install_app tmux
  install_app tree
  install_app vim
  install_app xclip

  install_app bat
  install_app fd
  install_app fzf
  install_app ripgrep rg
}
