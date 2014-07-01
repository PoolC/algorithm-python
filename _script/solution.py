#!/usr/bin/env python
import sys
rl = lambda: sys.stdin.readline()
#f = open('input.dat', 'r')
#rl = lambda: f.readline()
#import pdb
#pdb.set_trace()


n = int(rl())
for i in range(n):
      print "Hello, %s!" % rl().strip()
