#!/bin/bash

. `dirname $0`/core.sh

sudo apt update

install_apt meld
install_manual vscode code
