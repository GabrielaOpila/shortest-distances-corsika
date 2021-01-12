import numpy as np
import pandas as pd
import os
import sys
plik = sys.argv[1]
xshift = float(sys.argv[2])
yshift = float(sys.argv[3])
with open(plik, "r") as f:
    t = pd.read_table(plik, delimiter='*')
f.close()    
rows=len(t.index)
arr = t.to_numpy() 
sd = 10000000
#xshift = 172
#yshift = 0.02
nazwa = "shifted_shower"+str(xshift)+"_"+str(yshift)+".txt"
result_file = open(nazwa, "w")

for i in range(rows):
    arr[i][1]=arr[i][1]+xshift
    arr[i][2]=arr[i][2]+yshift
#content = str(arr)

    result_file.write(' '+ str(arr[i][0]))
    result_file.write(' '+ str(arr[i][1]))
    result_file.write(' '+ str(arr[i][2]))
    result_file.write(' '+ str(arr[i][3]))
    result_file.write(' '+ str(arr[i][4]))
    result_file.write('\n')

result_file.close()

