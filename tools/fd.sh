#!/bin/bash

curl -L https://github.com/sharkdp/fd/releases/download/v10.2.0/fd_10.2.0_amd64.deb -o /tmp/fd.deb
sudo dpkg -i /tmp/fd.deb
rm /tmp/fd.deb
