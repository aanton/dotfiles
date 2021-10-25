#!/bin/bash

print_info "Installing tmux ..."
sudo apt install -y tmux

print_info "Installing Tmux Plugin Manager ..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

print_info "Install tmux plugins using $(tput smso)<prefix> + I$(tput rmso)"