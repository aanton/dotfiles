#!/bin/bash

. `dirname $0`/core.sh

update_apt

install_apt meld
install_manual google-chrome
install_manual vscode code
