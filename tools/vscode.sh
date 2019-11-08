#!/bin/bash

curl -L https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -o /tmp/vscode.deb
sudo dpkg -i /tmp/vscode.deb
rm /tmp/vscode.deb
