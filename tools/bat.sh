#!/bin/bash

curl -L https://github.com/sharkdp/bat/releases/download/v0.22.1/bat_0.22.1_amd64.deb -o /tmp/bat.deb
sudo dpkg -i /tmp/bat.deb
rm /tmp/bat.deb
