#!/bin/bash

. `dirname $0`/core.sh

sudo apt update

echo "Installing optional development tools ..."
ask_for_installation docker && install_manual docker
ask_for_installation "php & php extensions" && install_manual php
ask_for_installation "composer" && install_manual composer

echo "Installing optional desktop tools ..."
ask_for_installation filezilla && install_apt filezilla