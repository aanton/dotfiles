#!/bin/bash

curl -L https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb -o /tmp/ripgrep.deb
sudo dpkg -i /tmp/ripgrep.deb
rm /tmp/ripgrep.deb
