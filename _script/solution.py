#!/usr/bin/env python
import sys

IS_DEBUG = False
IS_DEBUG = True
if IS_DEBUG:
    f = open('input.dat', 'r')
    rl = lambda: f.readline()
    import pdb
    pdb.set_trace()
else:
    rl = lambda: sys.stdin.readline()

def main():
    n = int(rl())
    for i in range(n):
        print "Hello, %s!" % rl().strip()
#        input_cnt = int(rl())
#        input_list = map(int, rl().split())


if __name__ == "__main__":
    main()
    if IS_DEBUG and type(f) == file:
        f.close()

