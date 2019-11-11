#!/bin/bash

function install_clipit {
  sudo apt install clipit
}

function create_clipit_symlink {
  create_symlink clipit/clipitrc .config/clipit/clipitrc
}

install_clipit
create_clipit_symlink
