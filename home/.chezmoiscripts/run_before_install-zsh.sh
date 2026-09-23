#!/usr/bin/env bash
set -euo pipefail

install_zsh() {
  if [ "$(id -u)" -eq 0 ]; then
    apt-get update
    apt-get install -y zsh
  elif command -v sudo >/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y zsh
  else
    echo "zsh is not installed and sudo is unavailable." >&2
    exit 1
  fi
}

if ! command -v zsh >/dev/null 2>&1; then
  install_zsh
fi

if [ "$(id -u)" -eq 0 ]; then
  chsh -s /bin/zsh "$USER" || true
elif command -v sudo >/dev/null 2>&1; then
  sudo chsh -s /bin/zsh "$USER" || true
fi
