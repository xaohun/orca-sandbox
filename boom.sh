#!/bin/bash
cd "$(dirname "$0")"
mkdir -p junk && rm -f junk/*
printf "def f(: pass
" > junk/e1.py
printf "print(1/0)
" > junk/e2.py
printf "#!/bin/bash
source /nonexistent/nowhere.sh
" > junk/e3.sh
printf "import definitely_not_a_module
" > junk/e4.py
echo "--- boom ---"
for f in junk/*; do
  case "$f" in
    *.py) timeout 3 python3 "$f" 2>&1 | tail -n1 ;;
    *.sh) timeout 3 bash "$f" 2>&1 | tail -n1 ;;
  esac
done
echo "--- bury ---"
rm -rf junk && echo "junk cleared"
