#!/bin/bash

function create_gitconfig {
  local -r DESTINATION="${HOME}/.gitconfig.local"

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
  NAME=${USER}

  cat > $DESTINATION <<- TXT
DEFAULT_USER="${NAME}"

TXT
}

create_gitconfig
create_zshrc
