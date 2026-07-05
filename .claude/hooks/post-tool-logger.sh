#!/bin/bash
# LOG hook — records every terraform plan to the deploy log

INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

if echo "$CMD" | grep -q "terraform plan"; then
  echo "[$(date -u +%Y-%m-%dT%H:%M:%SZ)] terraform apply executed" >> .claude/deploy.log
fi
