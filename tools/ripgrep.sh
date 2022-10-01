#!/bin/bash

curl -L https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb -o /tmp/ripgrep.deb
sudo dpkg -i /tmp/ripgrep.deb
rm /tmp/ripgrep.deb
