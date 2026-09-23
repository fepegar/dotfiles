#!/usr/bin/env bash
set -euo pipefail

if command -v copilot >/dev/null 2>&1; then
  exit 0
fi

curl -fsSL https://gh.io/copilot-install | bash
