#!/usr/bin/env bash
# Adds `version: 1.0.0` after the `name:` line in skills missing it.
# Run from the root of your claude-skills repo.
set -euo pipefail

SKILLS=(
  clarifying-questions context-audit decision-toolkit dispatcher
  earnings-analysis fact-checker find-skills frontend-design
  frontend-slides handoff request-validator sparring-partner
  stress-test style-enforcer-pipeline summarize-doc
)

for d in "${SKILLS[@]}"; do
  f="$d/SKILL.md"
  [ -f "$f" ] || { echo "MISSING $f"; continue; }
  if grep -q '^version:' "$f"; then echo "SKIP $d (has version)"; continue; fi
  awk '/^name:/ && !done {print; print "version: 1.0.0"; done=1; next} {print}' "$f" > "$f.tmp" && mv "$f.tmp" "$f"
  echo "OK   $d"
done
echo "Done. compact-conversation and handoff are replaced separately from changed-skills/."
