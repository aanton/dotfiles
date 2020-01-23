#!/bin/bash

#### COMMAND ###################################################################

function check_vscode_extensions {
  diff -y --color \
    <(echo "File tools/vscode-extensions.txt"; cat ${PROJECTDIR}/tools/vscode-extensions.txt) \
    <(echo "Current installed extensions"; code --list-extensions | sort)
}
