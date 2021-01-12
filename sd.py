'''
Program takes .txt file with columns id, e, x, y, w
as an input. Then it calculates the smallest distance between (x,y) points.
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

    sd = 10000000 #smallest distance (just a placeholder value)
    for i in range(rows):
        for j in range(i):
            d = np.sqrt(np.square(arr[i][1]-arr[j][1])+np.square(arr[i][2]-arr[j][2])) #calculate distance
            #print(d)
            #if(j!=i):
            if(d<sd):
                sd = d
                rowsd2 = i
                rowsd1 = j
    
    d1 = np.sqrt(np.square(arr[rowsd1][1])+np.square(arr[rowsd1][2])) 
#calculate  1st particle's distance from primary particle's axis 
    d2 = np.sqrt(np.square(arr[rowsd2][1])+np.square(arr[rowsd2][2])) 
#calculate  2nd particle's distance from primary particle's axis 
    file2 = open("min_dist.txt", "a")  
    file2.write('%6f'%sd)
    file2.write('\n')
    file2.close() 

    file3 = open("everything.txt", "a")
    file3.write('%6f'%sd) #distance
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

#    print("The smallest distance is: ")
#    print('%6f'%sd+" cm")


#    print("Between rows: ")
#    print(str(rowsd1))
#    print("And: ")
#    print(str(rowsd2))   

#    print("1st particle's id is: ")
#    print(str(arr[rowsd1][0]))
#    print("2nd particle's id is: ")
#    print(arr[rowsd2][0])


#    print("1st particle's energy [GeV] is: ")
#    print(arr[rowsd1][3])
#    print("2nd particle's energy [GeV] is: ")
#    print(arr[rowsd2][3])


#    print("1st particle's distance from primary particle's axis is: ")
#    print('%6f'%d1+" cm")
#    print("2nd particle's distance from primary particle's axis is: ")
#    print('%6f'%d2+" cm")
'''

    file1 = open("Summary.txt", "a")  

    file1.write("The smallest distance is: ")
    file1.write('%6f'%sd+" cm\n")


    file1.write("Between rows: ")
    file1.write(str(rowsd1))
    file1.write("And: ")
    file1.write(str(rowsd2))   
    file1.write('\n')

    file1.write("1st particle's id is: ")
    file1.write(str(arr[rowsd1][2]))
    file1.write('\n')
    file1.write("2nd particle's id is: ")
    file1.write(str(arr[rowsd2][2]))
    file1.write('\n')


    file1.write("1st particle's energy [GeV] is: ")
    file1.write(str(arr[rowsd1][3]))
    file1.write('\n')
    file1.write("2nd particle's energy [GeV] is: ")
    file1.write(str(arr[rowsd2][3]))
    file1.write('\n')

    file1.write("1st particle's distance from primary particle's axis is: ")
    file1.write('%6f'%d1+" cm")
    file1.write('\n')
    file1.write("2nd particle's distance from primary particle's axis is: ")
    file1.write('%6f'%d2+" cm")
    file1.write('\n')

    file1.close()  
'''
    
