#!/bin/bash
cd "$(dirname "$0")"
N=${1:-8}
mapfile -t F < <(ls cells/* 2>/dev/null | shuf | head -n "$N")
for f in "${F[@]}"; do rm -f "$f"; done
printf "pop: %s crushed, %s left
" "${#F[@]}" "$(ls cells 2>/dev/null | wc -l)"
