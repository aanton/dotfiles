#!/bin/bash

curl -L https://github.com/sharkdp/fd/releases/download/v8.2.1/fd_8.2.1_amd64.deb -o /tmp/fd.deb
sudo dpkg -i /tmp/fd.deb
rm /tmp/fd.deb
