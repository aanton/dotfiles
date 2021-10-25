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
allow-bold=true
background-color='#2E3440'
bold-color-same-as-fg=true
bold-color='#D8DEE9'
cursor-background-color='rgb(216,222,233)'
cursor-colors-set=true
cursor-foreground-color='rgb(59,66,82)'
default-size-columns=200
default-size-rows=80
font='UbuntuMono Nerd Font Mono 14'
foreground-color='#D8DEE9'
highlight-background-color='rgb(136,192,208)'
highlight-colors-set=true
highlight-foreground-color='rgb(46,52,64)'
nord-gnome-terminal-version='0.1.0'
palette=['#3B4252', '#BF616A', '#A3BE8C', '#EBCB8B', '#81A1C1', '#B48EAD', '#88C0D0', '#E5E9F0', '#4C566A', '#BF616A', '#A3BE8C', '#EBCB8B', '#81A1C1', '#B48EAD', '#8FBCBB', '#ECEFF4']
use-system-font=false
use-theme-background=false
use-theme-colors=false
use-theme-transparency=false
use-transparent-background=false
visible-name='Nord'

EOT
)

  local -r PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default | sed "s/'//g")
  dconf load "/org/gnome/terminal/legacy/profiles:/:${PROFILE}/" < <(echo "$DUMP")
}

#### COMMAND ###################################################################

function configure_gnome {
  if [[ -v SKIP_DESKTOP_TOOLS && "$SKIP_DESKTOP_TOOLS" = true ]]; then
    print_warning "Skipping configuration of gnome desktop & terminal"
    return 0
  fi

  ask_for_configuration "gnome-terminal \"default\" profile" && configure_gnome_terminal
}
