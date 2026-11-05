#!/usr/bin/env bash
# Install claude-kit into ~/.claude (macOS / Linux / Git Bash / cloud sessions).
#
#   bash install.sh             install or update
#   bash install.sh --uninstall remove everything the kit installed
#
# Copies (doesn't symlink) so it works the same everywhere; re-run after
# `git pull` to update. Only touches what the kit owns: ~/.claude/CLAUDE.md
# (an existing non-kit one is backed up first) and the skill folders listed in
# skills/ and third-party/. Never run this in the filming clean room.
set -euo pipefail

KIT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${CLAUDE_HOME:-$HOME/.claude}"
MARK="# Kurt - personal instructions (claude-kit)"
MANIFEST="$DEST/.claude-kit-skills"

kit_skills() {
  for d in "$KIT"/skills/*/ "$KIT"/third-party/*/; do
    if [ -f "$d/SKILL.md" ]; then basename "$d"; fi
  done
}

if [ "${1:-}" = "--uninstall" ]; then
  if [ -f "$MANIFEST" ]; then
    while read -r s; do [ -n "$s" ] && rm -rf "$DEST/skills/$s"; done < "$MANIFEST"
    rm -f "$MANIFEST"
  fi
  if [ -f "$DEST/CLAUDE.md" ] && head -1 "$DEST/CLAUDE.md" | grep -qF "$MARK"; then
    rm -f "$DEST/CLAUDE.md"
  fi
  echo "[claude-kit] uninstalled (backups of your own CLAUDE.md, if any, are untouched)"
  exit 0
fi

mkdir -p "$DEST/skills"

# Personal instructions: back up a CLAUDE.md that isn't the kit's.
if [ -f "$DEST/CLAUDE.md" ] && ! head -1 "$DEST/CLAUDE.md" | grep -qF "$MARK"; then
  bak="$DEST/CLAUDE.md.bak-$(date +%Y%m%d-%H%M%S)"
  cp "$DEST/CLAUDE.md" "$bak"
  echo "[claude-kit] backed up your existing CLAUDE.md to $bak"
fi
cp "$KIT/CLAUDE.md" "$DEST/CLAUDE.md"

# Skills: remove ones the kit installed last time but no longer ships.
current="$(kit_skills)"
if [ -f "$MANIFEST" ]; then
  while read -r s; do
    if [ -n "$s" ] && ! grep -qx "$s" <<< "$current"; then
      rm -rf "$DEST/skills/$s"
      echo "[claude-kit] removed retired skill $s"
    fi
  done < "$MANIFEST"
fi
: > "$MANIFEST"
for d in "$KIT"/skills/*/ "$KIT"/third-party/*/; do
  [ -f "$d/SKILL.md" ] || continue
  name="$(basename "$d")"
  rm -rf "$DEST/skills/$name"
  cp -R "$d" "$DEST/skills/$name"
  echo "$name" >> "$MANIFEST"
done

echo "[claude-kit] installed into $DEST: CLAUDE.md + $(wc -l < "$MANIFEST" | tr -d ' ') skills ($(paste -sd, "$MANIFEST"))"
