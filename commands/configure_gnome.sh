#!/bin/bash

#### AUXILIARY FUNCTIONS #######################################################

function configure_gnome_terminal {
  print_info "Configuring gnome-terminal ..."

  # List profiles
  # dconf dump /org/gnome/terminal/legacy/profiles:/ | grep -e "\[\:\|visible-name"

  # Dump a profile
  # dconf dump /org/gnome/terminal/legacy/profiles:/:xx-xx-xx-xx-xx/

  local -r DUMP=$(cat <<EOT
[/]
foreground-color='#9494A3A3A5A5'
visible-name='Dracula'
palette=['#444447475a5a', '#ffff55555555', '#5050fafa7b7b', '#ffffb8b86c6c', '#8b8be9e9fdfd', '#bdbd9393f9f9', '#ffff7979c6c6', '#9494A3A3A5A5', '#000000000000', '#ffff55555555', '#5050fafa7b7b', '#ffffb8b86c6c', '#8b8be9e9fdfd', '#bdbd9393f9f9', '#ffff7979c6c6', '#ffffffffffff']
use-system-font=false
highlight-colors-set=true
use-theme-colors=false
font='UbuntuMono Nerd Font Mono 14'
use-theme-transparency=false
allow-bold=true
use-theme-background=false
bold-color-same-as-fg=true
bold-color='#9494A3A3A5A5'
background-color='#28282a2a3636'
highlight-background-color='#'
highlight-foreground-color='#'

EOT
)

  local -r PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default | sed "s/'//g")
  dconf load "/org/gnome/terminal/legacy/profiles:/:${PROFILE}/" < <(echo "$DUMP")
}

#### COMMAND ###################################################################

function configure_gnome {
  if [[ -v SKIP_DESKTOP_TOOLS && "$SKIP_DESKTOP_TOOLS" = true ]]; then
    return 0
  fi

  ask_for_installation "gnome-terminal \"default\" profile" && configure_gnome_terminal
}
