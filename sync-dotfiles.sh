#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_CONFIG="$HOME/.config"
DST_CONFIG="$REPO_DIR/.config"

notify() {
  if command -v notify-send >/dev/null 2>&1; then
    notify-send -t 2500 "$@" || true
  fi
}

notify "Dotfiles" "Sync starting…"

mkdir -p "$DST_CONFIG"

# Allowlist what we actually want to version
INCLUDE=(
  "hypr"
  "swaync"
  "systemd/user"
  "gtk-3.0"
  "OpenRGB"
)

# rsync each include to avoid accidentally pulling giant dirs
for rel in "${INCLUDE[@]}"; do
  src="$SRC_CONFIG/$rel"
  dst="$DST_CONFIG/$rel"
  if [ -e "$src" ]; then
    mkdir -p "$(dirname "$dst")"
    rsync -a --delete --exclude='.git' "$src" "$dst"
  fi
done

cd "$REPO_DIR"

git add -A

if git diff --cached --quiet; then
  notify "Dotfiles" "No changes."
  echo "No changes to commit."
  exit 0
fi

git commit -m "sync dotfiles $(date -Is)" || true

# Push if a remote exists
if git remote get-url origin >/dev/null 2>&1; then
  git push || true
fi

notify "Dotfiles" "Sync complete."
