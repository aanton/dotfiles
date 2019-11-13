#!/bin/bash

. `dirname $0`/core.sh

#### USAGE #####################################################################

function usage {
  USAGE=$(cat <<EOT
Usage: install.sh <command>

Available commands:
• all: Configure dotfiles & install all tools
• configure_gnome: Configure gnome desktop & terminal
• create_local_configs: Create local configuration files
• create_symlinks: Create symbolic links for configuration files
• install_common_tools: Install common tools
• install_desktop_tools: Install desktop tools
• install_dev_tools: Install development tools
• install_fonts: Install fonts
• install_vscode_extensions: Install vscode extensions

EOT
)
  print_warning "$USAGE"

  exit 0
}

#### COMMAND: RUN ALL ##########################################################

function run_all_commands {
  local -r COMMANDS=( create_symlinks create_local_configs install_common_tools install_fonts install_desktop_tools install_dev_tools configure_gnome )
  local COMMAND
  for COMMAND in "${COMMANDS[@]}"; do
    run_command "${COMMAND}"
  done
}

#### COMMAND: RUN ONE ##########################################################

function run_command {
  local -r $COMMAND=$1

  # Check if the command exists
  COMMAND_SCRIPT=${PROJECTDIR}/commands/${COMMAND}.sh
  if [ ! -f "$COMMAND_SCRIPT" ]; then
    print_error "Unknown command: $COMMAND"
    usage
  fi

  # Load the command file & execute it
  print_info "Running command: ${COMMAND} ..."
  . $COMMAND_SCRIPT
  $COMMAND
}

#### MAIN ######################################################################

function main {
  # Show help if no command is provided
  [ $# -eq 0 ] && usage

  COMMAND="$1"

  # Update APT but only in some commands
  if [[ $COMMAND == all || $COMMAND == install*tools ]]; then
    update_apt
  fi

  case $COMMAND in
    all)
      run_all_commands
      ;;

    *)
      run_command "$COMMAND"
      ;;
  esac
}

main "$@"
print_info "Command finished: $COMMAND"
