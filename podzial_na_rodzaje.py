'''
Program takes .txt file with columns id, e, x, y, w
as an input. Then it creates new files for photons, electrons and positrons.
'''

import numpy as np
import pandas as pd
import os
import sys
plik = sys.argv[1]
with open(plik, "r") as f:
    lines = f.readlines()[3:]

f.close()

counter = 0

filename = "new_"+str(counter)+".txt"

plik_na_fotony = "fotony.txt"
fotony = open(plik_na_fotony, "a")             
plik_na_elektrony = "elektrony.txt"
elektrony = open(plik_na_elektrony, "a")             
plik_na_pozytony = "pozytony.txt"
pozytony = open(plik_na_pozytony, "a")             
g = open(filename, "w")             
for line in lines:

   if line != "---------------------------------\n":
        g.write(line)
   else:
        counter = counter + 1
        g.close()
        filename = "new_"+str(counter)+".txt"
        #print(filename,'\n')
        g = open(filename, "w")             

g.close()
print(counter)
while(counter>0):
    #print("zaczynamy while")
    counter = counter -1
    nazwa = "new_"+str(counter)+".txt"
    if os.stat(nazwa).st_size == 0:
        continue
    print(nazwa)
    t = pd.read_table(nazwa, delimiter ='*')

#read dat file, get rid of *** in 1st and 3rd row
    rows=len(t.index)
    if rows<2:
        continue
#print(t)
#print('\nDataFrame datatypes :\n', t.dtypes)
#just to check what datatypes we have
    arr = t.to_numpy() 
#because numpy array is more comfortable to work with than  pandas DataFrame
#print('\nNumpy Array\n----------\n', arr)

    for i in range(rows):
        if(arr[i][0]==1):
            fotony.write(str(arr[i][3]))
            fotony.write('\n')
        if(arr[i][0]==2):
            pozytony.write(str(arr[i][3]))
            pozytony.write('\n')
        if(arr[i][0]==3):
            elektrony.write(str(arr[i][3]))
            elektrony.write('\n')
fotony.close()
elektrony.close()
pozytony.close()

    
