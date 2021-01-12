import numpy as np
import pandas as pd
import os
import sys
plik = sys.argv[1]
with open(plik, "r") as f:
    lines = f.readlines()[3:]

f.close()

#counter = 0
filename = "kompletshowerowzgwiazdkami.txt"
#filename = "new_"+str(counter)+".txt"
#print(filename,'\n')

g = open(filename, "a")             
for line in lines:

   if line != "---------------------------------\n":
        g.write(line)
#   else:
        #counter = counter + 1
#        g.close()
        #filename = "new_"+str(counter)+".txt"
        #print(filename,'\n')
#        g = open(filename, "w")             

g.close()
