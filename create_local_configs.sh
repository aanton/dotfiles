#!/bin/bash

function check_file_exists {
  if [ ! -f "$1" ]; then
    echo "Creating local file: $1 ..."
    return 1
  fi

  echo "File already exists: $1"
  return 0
}

function create_gitconfig {
  local -r DESTINATION="${HOME}/.gitconfig.local"

  check_file_exists $DESTINATION
  if [ $? -eq 0 ]; then
    return 0
  fi

  read -p "Enter your Git user.name [${USER}]: " NAME
  NAME=${NAME:-$USER}

  read -p "Enter your Git user.email [${NAME}@gmail.com]: " EMAIL
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
