#!/usr/bin/env python3
#import subprocess
import os

for N,Wmax in [(5,20), (10,20)]: #, in [(5,20), (10,20), (100,200), (1000,100) ]: 
  for seed in range(1000, 1005):
    os.system(f"./generatore {N} {Wmax} {seed} | ./poldo.py")       
