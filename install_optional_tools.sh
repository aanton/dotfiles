#!/bin/bash

. `dirname $0`/core.sh

sudo apt update

ask_for_installation docker && install_manual docker
