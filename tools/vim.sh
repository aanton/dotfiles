#!/bin/bash

print_info "Installing vim ..."
sudo apt install -y vim

print_info "Installing vim-plug ..."
if [ ! -f "~/.vim/autoload/plug.vim" ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  print_info "Run $(tput smso):PlugInstall$(tput rmso) in vim to install the plugins defined in .vimrc"
fi
