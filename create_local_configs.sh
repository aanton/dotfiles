#!/bin/bash

. `dirname $0`/core.sh

function check_file_exists {
  if [ ! -f "$1" ]; then
    print_info "Creating local file: $1 ..."
    return 1
  fi

  print_info "File already created: $1"
  return 0
}

function create_gitconfig {
  local -r DESTINATION="${HOME}/.gitconfig.local"

  check_file_exists $DESTINATION
  if [ $? -eq 0 ]; then
    return 0
  fi

  print_question "Enter your Git user.name [${USER}]:"
  read NAME
  NAME=${NAME:-$USER}

  print_question "Enter your Git user.email [${NAME}@gmail.com]:"
  read EMAIL
  EMAIL=${EMAIL:-${NAME}@gmail.com}

  cat > $DESTINATION <<- TXT
[user]
  name = $NAME
  email = $EMAIL

TXT
}

function create_zshrc {
  local -r DESTINATION="${HOME}/.zshrc.local"

  check_file_exists $DESTINATION
  if [ $? -eq 0 ]; then
    return 0
  fi

  NAME=${USER}

  cat > $DESTINATION <<- TXT
DEFAULT_USER="${NAME}"

TXT
}

create_gitconfig
create_zshrc
