#!/bin/bash

. `dirname $0`/core.sh

#### USAGE #####################################################################

function usage {
  USAGE=$(cat <<EOT
Usage: install.sh <command>

Available commands:
• all: Configure dotfiles & install all tools
• create_local_configs: Create local configuration files
• create_symlinks: Create symbolic links for configuration files
• install_common_tools: Install common tools
• install_desktop_tools: Install desktop tools
• install_dev_tools: Install development tools
• install_fonts: Install fonts

EOT
)
  print_warning "$USAGE"

  exit 0
}

#### COMMAND ALL ###############################################################

function run_all_commands {
  update_apt

  COMMANDS_DIR=`dirname $0`/commands
  for COMMAND in $(ls -1 $COMMANDS_DIR); do
    . ${COMMANDS_DIR}/${COMMAND}
  done

  create_symlinks
  create_local_configs
  install_common_tools
  install_fonts
  install_desktop_tools
  install_dev_tools
}

#### MAIN ######################################################################

function main {
  # Show help if no command is provided
  [ $# -eq 0 ] && usage

  COMMAND="$1"

  # Run all commands
  if [ $COMMAND = "all" ]; then
    run_all_commands
    return 0
  fi

  # Check if the command exists
  COMMAND_SCRIPT=`dirname $0`/commands/${COMMAND}.sh
  if [ ! -f "$COMMAND_SCRIPT" ]; then
    print_error "Unknown command: $COMMAND"
    usage
  fi

  # Update APT but only in some commands
  if [[ $COMMAND == install*tools ]]; then
    update_apt
  fi

  # Load command script & execute it
  . $COMMAND_SCRIPT
  $COMMAND
}

main "$@"
