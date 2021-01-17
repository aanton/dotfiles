#!/bin/bash

dpkg -s bat &> /dev/null
if [ $? -eq 0 ]; then
  sudo apt-get install -y bat
else
  curl -L https://github.com/sharkdp/bat/releases/download/v0.17.1/bat_0.17.1_amd64.deb -o /tmp/bat.deb
  sudo dpkg -i /tmp/bat.deb
  rm /tmp/bat.deb
fi
