#!/bin/bash

FONTS_DIR="${HOME}/.local/share/fonts"
RELOAD_FONTS=false

#### AUXILIARY FUNCTIONS #######################################################

function create_fonts_dir {
  if [ -d "${FONTS_DIR}" ]; then
    print_info "Fonts directory already created: ${FONTS_DIR}"
    return
  fi

  print_info "Creating fonts directory: ${FONTS_DIR}"
  mkdir -p "${FONTS_DIR}"
}

function reload_fonts {
  if [ "$RELOAD_FONTS" = true ]; then
    print_info "Reloading fonts"
    fc-cache -f
  fi
}

function check_font_installed {
  local -r NAME=$1

  if [ ! -f "${FONTS_DIR}/${NAME}" ]; then
    print_info "Font NOT found: ${NAME}"
    return 1
  fi

  print_info "Font already installed: ${NAME}"
  return 0
}

function install_fonts_firacode {
  local -r REPOSITORY="https://github.com/tonsky/FiraCode"

  for TYPE in Bold Light Medium Regular Retina; do
    local NAME="FiraCode-${TYPE}.ttf"

    check_font_installed "$NAME"
    if [ $? -ne 0 ]; then
      print_info "Installing font: ${NAME} ..."

      local SOURCE="${REPOSITORY}/blob/master/distr/ttf/${NAME}?raw=true"
      local DESTINATION="${FONTS_DIR}/${NAME}"

      curl -L "${SOURCE}" -o "${DESTINATION}"
      RELOAD_FONTS=true
    fi
  done
}

function install_fonts_jetbrains {
  local -r REPOSITORY="https://github.com/JetBrains/JetBrainsMono"

  for TYPE in Bold Bold-Italic ExtraBold ExtraBold-Italic Italic Medium Medium-Italic Regular; do
    local NAME="JetBrainsMono-${TYPE}.ttf"

    check_font_installed "$NAME"
    if [ $? -ne 0 ]; then
      print_info "Installing font: ${NAME} ..."

      local SOURCE="${REPOSITORY}/blob/master/ttf/${NAME}?raw=true"
      local DESTINATION="${FONTS_DIR}/${NAME}"

      curl -L "${SOURCE}" -o "${DESTINATION}"
      RELOAD_FONTS=true
    fi
  done
}

function install_fonts_nerd {
  local -r REPOSITORY="https://github.com/ryanoasis/nerd-fonts"
  local -r NAME="Ubuntu Mono Nerd Font Complete Mono.ttf"

  check_font_installed "$NAME"
  if [ $? -ne 0 ]; then
    print_info "Installing font: ${NAME} ..."

    local SOURCE="${REPOSITORY}/blob/master/patched-fonts/UbuntuMono/Regular/complete/${NAME}?raw=true"
    local DESTINATION="${FONTS_DIR}/${NAME}"

    SOURCE=$(echo "${SOURCE}" | sed 's/ /%20/g')
    curl -L "${SOURCE}" -o "${DESTINATION}"
    RELOAD_FONTS=true
  fi
}

#### COMMAND ###################################################################

function install_fonts {
  create_fonts_dir
  install_fonts_firacode
  install_fonts_jetbrains
  install_fonts_nerd
  reload_fonts
}
