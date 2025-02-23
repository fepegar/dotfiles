#! /bin/bash

set -x

if ! command -v zsh 2>&1 >/dev/null
then
  sudo apt install -y zsh
fi

sudo chsh -s /bin/zsh $USER
