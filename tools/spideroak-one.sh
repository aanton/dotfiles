#!/bin/bash

curl -L https://spideroak.com/release/spideroak/deb_x64 -o /tmp/spideroak.deb
sudo dpkg -i /tmp/spideroak.deb
rm /tmp/spideroak.deb
