#!/bin/bash

#### COMMAND ###################################################################

function install_vscode_extensions {
  for EXTENSION in $(cat ${PROJECTDIR}/tools/vscode-extensions.txt); do
    code --install-extension $EXTENSION --force
  done
}
