#!/usr/bin/env bash
set -euo pipefail

if command -v copilot >/dev/null 2>&1; then
  exit 0
fi

installer="$(mktemp)"
trap 'rm -f "$installer"' EXIT

curl --fail --show-error --silent --location \
  --connect-timeout 30 --max-time 300 \
  --retry 5 --retry-all-errors --retry-delay 3 \
  https://gh.io/copilot-install \
  --output "$installer"
bash "$installer"
