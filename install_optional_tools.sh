#!/bin/bash

. `dirname $0`/core.sh

sudo apt update

echo "Installing optional development tools ..."
ask_for_installation docker && install_manual docker

echo "Installing optional desktop tools ..."
ask_for_installation filezilla && install_apt filezilla
