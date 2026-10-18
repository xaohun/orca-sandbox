#!/bin/bash
cd "$(dirname "$0")"
rm -rf cells && mkdir -p cells
for i in $(seq 1 24); do
  printf "cell %02d - pop me
" "$i" > "cells/cell_$(printf %02d $i).txt"
done
echo "rebuilt: $(ls cells | wc -l) cells"
