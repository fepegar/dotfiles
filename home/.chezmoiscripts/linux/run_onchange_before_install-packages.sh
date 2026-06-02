#!/bin/bash

set -eufo pipefail

sudo apt-get install -y \
    nvtop \
    tree \
    unzip \
    zip

# Install and configure Git Credential Manager. This is necessary
# for authentication to Azure DevOps
curl -L https://aka.ms/gcm/linux-install-source.sh | sh
git-credential-manager configure
