#!/bin/bash
# 泡泡纸 · 通用版入口：./run.sh <工具名>
BASE="${HOME}/orca_sandbox"
mkdir -p "$BASE"
cd "$(dirname "$0")"
if [ -z "$1" ]; then
  echo "用法: ./run.sh rebuild|pop|melt|boom|wreck|gacha"
  exit 0
fi
if [ ! -f "$BASE/.ready" ]; then
  bash rebuild.sh; touch "$BASE/.ready"
fi
bash "$1.sh"
