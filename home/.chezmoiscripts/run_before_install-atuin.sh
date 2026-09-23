#!/usr/bin/env bash
set -euo pipefail

if command -v atuin >/dev/null 2>&1 &&
  atuin --version >/dev/null 2>&1; then
  exit 0
fi

if ! command -v mise >/dev/null 2>&1; then
  echo "Atuin requires mise, but mise is not installed." >&2
  exit 1
fi

mise use --global atuin@latest
mise install
