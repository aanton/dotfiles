#!/bin/bash

curl -L https://github.com/sharkdp/fd/releases/download/v8.4.0/fd_8.4.0_amd64.deb -o /tmp/fd.deb
sudo dpkg -i /tmp/fd.deb
rm /tmp/fd.deb
