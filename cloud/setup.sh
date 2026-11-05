#!/bin/bash
# Setup script for Kurt's own WORK cloud environments (e.g. kratos) — paste into
# claude.ai/code → environment → Edit → setup script. Installs the kit into the
# session's ~/.claude before Claude starts.
#
# NEVER add this to the "clean" filming environment, or to an environment
# used for someone else's project (e.g. lychee — Angell's): the kit tells
# Claude the person it's talking to is Kurt.
#
# Fail-safe: a setup script that exits non-zero stops the session from
# starting, so a failed clone only prints a warning. Cloud sessions can only
# clone GitHub repos attached to the session, so this needs the kit repo to
# be PUBLIC (it holds no secrets).
if git clone --depth 1 https://github.com/kriggithub/local_claude_kit /tmp/local_claude_kit 2>/dev/null; then
  bash /tmp/local_claude_kit/install.sh || echo "[claude-kit] install failed; session continues without the kit"
else
  echo "[claude-kit] couldn't clone the kit (is the repo public?); session continues without it"
fi
exit 0
