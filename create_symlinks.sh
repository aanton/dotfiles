#!/bin/bash

. `dirname $0`/core.sh

function create_symlink {
  local -r DESTINATION="${HOME}/${1}"
  local -r SOURCE="${PROJECTDIR}/symlinks/${1}"

  if [ -h ${DESTINATION} ]; then
    echo "Removing existing symlink: ${DESTINATION}"
    rm ${DESTINATION}

  elif [ -f "${DESTINATION}" ]; then
    echo "Backing up existing file: ${DESTINATION}"
    mv ${DESTINATION}{,.${DATETIME}}

  elif [ -d "${DESTINATION}" ]; then
    echo "Backing up existing directory: ${DESTINATION}"
    mv ${DESTINATION}{,.${DATETIME}}
  fi

  echo "Creating new symlink: ${DESTINATION}"
  ln -s ${SOURCE} ${DESTINATION}
}

create_symlink .gitconfig
create_symlink .zshrc
