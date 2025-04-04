#!/bin/bash

set -eufo pipefail

sudo apt-get update && sudo apt-get install -y \
    nvtop \
    tree \
    unzip
