#!/usr/bin/env bash
set -euo pipefail

apt_install() {
  if [ "$(id -u)" -eq 0 ]; then
    apt-get update
    apt-get install -y "$@"
  elif command -v sudo >/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y "$@"
  else
    echo "Package installation requires root or sudo." >&2
    exit 1
  fi
}

apt_install \
    nvtop \
    tree \
    unzip \
    zip

## Install and configure Git Credential Manager. This is necessary
## for authentication to Azure DevOps
#curl -L https://aka.ms/gcm/linux-install-source.sh | sh
#git-credential-manager configure
