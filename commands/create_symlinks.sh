#!/bin/bash

#### COMMAND ###################################################################

function create_symlinks {
  create_symlink .functions.sh
  create_symlink .gitconfig
  create_symlink .zshrc
}
