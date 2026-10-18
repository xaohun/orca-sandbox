import random, sys, glob
g = glob.glob('cells/*')
g = [x for x in g if not x.endswith('.py')]
if not g:
    print('nothing to melt')
    raise SystemExit
f = random.choice(g)
open(f, 'w').write(''.join(random.choice('*#@%&$') for _ in range(400)))
print('melted:', f)
