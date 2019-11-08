#!/bin/bash

. `dirname $0`/core.sh

FONTS_DIR="${HOME}/.local/share/fonts"
RELOAD_FONTS=false

function create_fonts_dir {
  if [ -d "${FONTS_DIR}" ]; then
    echo "Fonts directory already created: ${FONTS_DIR}"
    return
  fi

  echo "Creating fonts directory: ${FONTS_DIR}"
  mkdir -p "${FONTS_DIR}"
}

function reload_fonts {
  if [ "RELOAD_FONTS" = true ]; then
    echo "Reloading fonts"
    fc-cache -f
  fi
}

function install_fonts_firacode {
  local -r REPOSITORY="https://github.com/tonsky/FiraCode"

  for TYPE in Bold Light Medium Regular Retina; do
    local SOURCE="${REPOSITORY}/blob/master/distr/ttf/FiraCode-${TYPE}.ttf?raw=true"
    local DESTINATION="${FONTS_DIR}/FiraCode-${TYPE}.ttf"

    if [ ! -f "${DESTINATION}" ]; then
      echo "Installing font: ${DESTINATION}"
      wget -O ${DESTINATION} ${SOURCE}
      RELOAD_FONTS=true
    else
      echo "Font already installed: ${DESTINATION}"
    fi
  done
}

create_fonts_dir
install_fonts_firacode
reload_fonts
