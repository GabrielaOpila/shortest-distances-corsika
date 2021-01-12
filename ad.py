'''
Program takes .txt file with columns id, e, x, y, w
as an input. Then it calculates the distances between (x, y) points
and saves all the distances shorter than 64 cm to a file.
'''

import numpy as np
import pandas as pd
import os
import sys
plik = sys.argv[1]
with open(plik, "r") as f:
    lines = f.readlines()[3:]

f.close()
file3 = open("all_below_64cm.txt", "a")
counter = 0

filename = "new_"+str(counter)+".txt"
#print(filename,'\n')

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
    i = j = rowsd1 = rowsd2 = 0

    limit = 64 
    for i in range(rows):
        for j in range(i):
            d = np.sqrt(np.square(arr[i][1]-arr[j][1])+np.square(arr[i][2]-arr[j][2])) #calculate distance
            #print(d)
            #if(j!=i):
            if(d<limit):

                rowsd2 = i
                rowsd1 = j
    
                d1 = np.sqrt(np.square(arr[rowsd1][1])+np.square(arr[rowsd1][2])) 
#calculate  1st particle's distance from primary particle's axis 
                d2 = np.sqrt(np.square(arr[rowsd2][1])+np.square(arr[rowsd2][2])) 
#calculate  2nd particle's distance from primary particle's axis 



                file3.write('%f'%d) #distance
                file3.write(' '+ str(arr[rowsd1][0])) #id1
                file3.write(' '+ str(arr[rowsd2][0])) #id2
                file3.write(' '+ str(arr[rowsd1][1])) #x1
                file3.write(' '+ str(arr[rowsd2][1])) #x2
                file3.write(' '+ str(arr[rowsd1][2])) #y1
                file3.write(' '+ str(arr[rowsd2][2])) #y2
                file3.write(' '+ str(arr[rowsd1][3])) #e1
                file3.write(' '+ str(arr[rowsd2][3])) #e2
                file3.write(' '+ '%6f'%d1)
                file3.write(' '+ '%6f'%d2)
                file3.write('\n')
file3.close()


    
