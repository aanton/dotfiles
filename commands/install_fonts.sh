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
  if [ -d "/usr/share/fonts-firacode" ]; then
    print_info "Package FiraCode already installed"
    return 0
  fi

  install_app fonts-firacode
}

function install_fonts_jetbrains {
  local -r REPOSITORY="https://github.com/JetBrains/JetBrainsMono"

  for TYPE in Bold BoldItalic ExtraBold ExtraBoldItalic Italic Medium MediumItalic Regular; do
    local NAME="JetBrainsMono-${TYPE}.ttf"

    check_font_installed "$NAME"
    if [ $? -ne 0 ]; then
      print_info "Installing font: ${NAME} ..."

      local SOURCE="${REPOSITORY}/blob/master/fonts/ttf/${NAME}?raw=true"
      local DESTINATION="${FONTS_DIR}/${NAME}"

      curl --fail -sS -L "${SOURCE}" -o "${DESTINATION}"
      RELOAD_FONTS=true
    fi
  done
}

function install_fonts_nerd {
  local -r REPOSITORY="https://github.com/ryanoasis/nerd-fonts"
  local -r NAME="UbuntuMonoNerdFontMono-Regular.ttf"

  check_font_installed "$NAME"
  if [ $? -ne 0 ]; then
    print_info "Installing font: ${NAME} ..."

    local SOURCE="${REPOSITORY}/blob/master/patched-fonts/UbuntuMono/Regular/${NAME}?raw=true"
    local DESTINATION="${FONTS_DIR}/${NAME}"

    SOURCE=$(echo "${SOURCE}" | sed 's/ /%20/g')
    curl --fail -sS -L "${SOURCE}" -o "${DESTINATION}"
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
