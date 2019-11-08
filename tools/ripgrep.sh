#!/bin/bash

curl -L https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb -o /tmp/ripgrep.deb
sudo dpkg -i /tmp/ripgrep.deb
rm /tmp/ripgrep.deb
