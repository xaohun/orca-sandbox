import random, os
src = 'cells/cell_01.txt'
if not os.path.exists(src):
    print('run rebuild first')
    raise SystemExit
data = open(src, 'rb').read() * 200
parts = [data[i::7] for i in range(7)]
random.shuffle(parts)
open('wrecked.bin', 'wb').write(b''.join(parts))
print('wrecked.bin', os.path.getsize('wrecked.bin'), 'bytes')
