#!/bin/bash

. `dirname $0`/core.sh

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

sudo apt update

install_zsh

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
