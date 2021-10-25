#!/bin/bash

#### AUXILIARY FUNCTIONS #######################################################

function create_common_symlinks {
  create_symlink .functions.sh
  create_symlink .gitconfig
  create_symlink .zshrc
  create_symlink .tmux.conf
  create_symlink .vimrc

  create_symlink .prettierrc
}

function create_clipit_symlinks {
  if [ $(which clipit) ]; then
    mkdir -p ${HOME}/.config/clipit
    create_symlink clipit/clipitrc .config/clipit/clipitrc
  fi
}

function create_vscode_symlinks {
  if [ $(which code) ]; then
    mkdir -p ${HOME}/.config/Code/User
    create_symlink vscode/settings.json .config/Code/User/settings.json
    create_symlink vscode/keybindings.json .config/Code/User/keybindings.json
    create_symlink vscode/snippets .config/Code/User/snippets
  fi
}

#### COMMAND ###################################################################

function create_symlinks {
  create_common_symlinks

  create_clipit_symlinks
  create_vscode_symlinks
}
