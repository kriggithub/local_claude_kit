#!/bin/bash
# Setup script for a WORK cloud environment (Kratos, lychee, …) — paste into
# claude.ai/code → environment → Edit → setup script. Installs claude-kit into
# the session's ~/.claude before Claude starts.
#
# NEVER add this to the "clean" filming environment.
#
# If the kit repo is private and this clone fails in the setup script, either
# make the kit repo public (it holds no secrets) or enable the needed skills
# on the claude.ai account instead.
set -e
git clone --depth 1 https://github.com/kriggithub/local_claude_kit /tmp/local_claude_kit
bash /tmp/local_claude_kit/install.sh
