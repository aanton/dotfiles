#!/bin/bash

. `dirname $0`/core.sh

update_apt

print_info "Installing optional development tools ..."
ask_for_installation docker && install_manual docker
ask_for_installation "php & php extensions" && install_manual php
ask_for_installation "composer" && install_manual composer
ask_for_installation node && install_manual node

print_info "Installing optional desktop tools ..."
ask_for_installation filezilla && install_apt filezilla
