#!/bin/bash

print_info "Installing nvm ..."
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git -c advice.detachedHead=false checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

print_info "Checking nvm installation ..."
print_info "nvm version is $(nvm --version)"

print_info "Installing node v14 ..."
nvm install 14

print_info "Installing node v16 ..."
nvm install 16

print_info "Setting node v14 as default version ..."
nvm alias default 14

print_info "Checking default node & npm versions ..."
print_info "node version is $(node --version)"
print_info "npm version is $(npm --version)"
