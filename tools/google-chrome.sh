#!/bin/bash

curl -fsSL https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /tmp/google-chrome.deb
sudo dpkg -i /tmp/google-chrome.deb
rm /tmp/google-chrome.sh
