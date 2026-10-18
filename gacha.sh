#!/bin/bash
cd "$(dirname "$0")"
CNT=.gacha_count
n=$(cat "$CNT" 2>/dev/null || echo 0); n=$((n+1))
r=$((RANDOM % 1000))
rarity=N
if [ "$n" -ge 20 ]; then rarity=SSR; n=0
elif [ "$r" -lt 30 ]; then rarity=SSR; n=0
elif [ "$r" -lt 130 ]; then rarity=SR
elif [ "$r" -lt 380 ]; then rarity=R
fi
echo "$n" > "$CNT"
bash rebuild.sh > /dev/null
case "$rarity" in
  R) printf "mangled
" > cells/mangle.txt; : > cells/empty_shell.txt ;;
  SR) printf "shard %s
" "$RANDOM" > "cells/shard_$RANDOM.txt"; printf "fragment: %s
" "$(shuf -n1 ssr_pool.txt)" > cells/anomaly.txt ;;
  SSR) printf "%s
" "$(shuf -n1 ssr_pool.txt)" > cells/SSR_card.txt ;;
esac
printf "[gacha] %s (pity %s/20) | %s cells
" "$rarity" "$n" "$(ls cells | wc -l)"
[ -f cells/SSR_card.txt ] && printf "SSR: %s
" "$(cat cells/SSR_card.txt)"
