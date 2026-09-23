#!/usr/bin/env bash
set -euo pipefail

mise install

if ! command -v npm >/dev/null 2>&1; then
  echo "Codex requires npm, but npm is not installed." >&2
  exit 1
fi

if ! command -v codex >/dev/null 2>&1; then
  echo "Installing OpenAI Codex CLI..."
  npm install --global @openai/codex@latest
fi

codex_path="$(which codex)"
if [ -z "$codex_path" ] || [ ! -x "$codex_path" ]; then
  echo "Codex was not found after installation." >&2
  exit 1
fi

mkdir -p "$HOME/.codex"
cat > "$HOME/.codex/config.toml" <<EOF
model_provider = "github-copilot-direct"
model = "gpt-6-sol"
service_tier = "default"

[model_providers.github-copilot-direct]
name = "GitHub Copilot Direct"
base_url = "https://api.githubcopilot.com"
requires_openai_auth = false

[model_providers.github-copilot-direct.auth]
command = "$codex_path"
args = ["auth", "token"]
EOF
