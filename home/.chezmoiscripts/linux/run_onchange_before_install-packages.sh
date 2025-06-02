#!/bin/bash

set -eufo pipefail

sudo apt-get install -y \
    nvtop \
    tree \
    unzip

# Install and configure Git Credential Manager
# This is necessary for authentication to Azure DevOps
# Adapted from Anton's https://github.com/ant0nsc/dotfiles/commit/0636107d34d9a89642c486aaae7ad1cda49469f9
GCM_FILE="gcm-linux_amd64.2.6.1.deb"
LOCAL_GCM_FILE="/tmp/$GCM_FILE"
if [ ! -f $LOCAL_GCM_FILE ]; then
    echo "Downloading Git Credential Manager..."
    wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.1/$GCM_FILE -O $LOCAL_GCM_FILE
else
    echo "Git Credential Manager already downloaded."
fi
sudo dpkg -i $LOCAL_GCM_FILE
git-credential-manager configure
