#!/usr/bin/env python2

import os
import re
import sys

try:
   bin_blob = sys.argv[1]
   boot_uncompressed = sys.argv[2]
   args_uncompressed = sys.argv[3]
   kernel_image = sys.argv[4]
   kernel_output = sys.argv[5]
except: 
   bin_blob = ""
   boot_uncompressed = ""
   args_uncompressed = ""
   kernel_image = ""
   kernel_output = ""

if kernel_image == "" or kernel_output == "" or boot_uncompressed == "" or args_uncompressed == "" or bin_blob == "":
  print("usage : imagetool-uncompressed.py <first32k.bin> <boot-uncompressed.txt> <args-uncompressed.txt> <kernel image> <output kernel>");
  sys.exit(0)
   
re_line = re.compile(r"0x(?P<value>[0-9a-f]{8})")

mem = [0 for i in range(32768)]

def load_to_mem(name, addr):
   f = open(name)

   for l in f.readlines():
      m = re_line.match(l)

      if m:
         value = int(m.group("value"), 16)

         for i in range(4):
            mem[addr] = int(value >> i * 8 & 0xff)
            addr += 1

   f.close()

load_to_mem(boot_uncompressed, 0x00000000)
load_to_mem(args_uncompressed, 0x00000100)

f = open(bin_blob, "wb")

for m in mem:
   f.write(chr(m))

f.close()

os.system("cat " + bin_blob + " " + kernel_image + " > " + kernel_output)
