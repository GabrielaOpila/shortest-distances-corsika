import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sb
import matplotlib.ticker as ticker
import matplotlib.cm as cm
import matplotlib as mpl
import sys
plik1 = sys.argv[1]
plik2 = sys.argv[2]
t1 = pd.read_table(plik1, delimiter = ' ') 
t2 = pd.read_table(plik2, delimiter = ' ') 
print(t2)
print(t1)
#print('\nDataFrame datatypes :\n', t.dtypes) #just to check what datatypes we have
arr1 = t1.to_numpy() #because numpy array is more comfortable to work with than  pandas DataFrame
#print('\nNumpy Array\n----------\n', arr)
arr2 = t2.to_numpy() #because numpy array is more comfortable to work with than  pandas DataFrame
data1 = arr1[:, [1,2,3,4]]
data2 = arr2[:, [1,2,3,4]]
id_particle1= data1[:, 0]
x_particle1 = data1[:, 1]
y_particle1 = data1[:, 2]
e_particle1 = data1[:, 3]
id_particle2= data2[:, 0]
x_particle2 = data2[:, 1]
y_particle2 = data2[:, 2]
e_particle2 = data2[:, 3]

rows1=len(t1.index)
rows2=len(t2.index)

result1 = open("min_dist_preshower1.txt", "w")
result2 = open("min_dist_preshower2.txt", "w")
result3 = open("min_dist_preshower3.txt", "w")
limit=64
for i in range(rows1):
    for j in range(i):
        d = np.sqrt(np.square(x_particle1[i]-x_particle1[j])+np.square(y_particle1[i]-y_particle1[j]))
        if(d<limit):
            d1 = np.sqrt(np.square(x_particle1[i])+np.square(y_particle1[i]))
            d2 = np.sqrt(np.square(x_particle1[j])+np.square(y_particle1[j]))
            result1.write('%f'%d) #distance
            result1.write(' '+ str(id_particle1[i])) #id1
            result1.write(' '+ str(id_particle1[j])) #id1
            result1.write(' '+ str(x_particle1[i])) #id1
            result1.write(' '+ str(x_particle1[j])) #id1
            result1.write(' '+ str(y_particle1[i])) #id1
            result1.write(' '+ str(y_particle1[j])) #id1
            result1.write(' '+ str(e_particle1[i])) #id1
            result1.write(' '+ str(e_particle1[j])) #id1
            result1.write(' '+ '%6f'%d1)
            result1.write(' '+ '%6f'%d2)
            result1.write('\n')        
result1.close()

for i in range(rows2):
    for j in range(i):
        d = np.sqrt(np.square(x_particle2[i]-x_particle2[j])+np.square(y_particle2[i]-y_particle2[j]))
        if(d<limit):
            d1 = np.sqrt(np.square(x_particle2[i])+np.square(y_particle2[i]))
            d2 = np.sqrt(np.square(x_particle2[j])+np.square(y_particle2[j]))
            result2.write('%f'%d) #distance
            result2.write(' '+ str(id_particle2[i])) #id1
            result2.write(' '+ str(id_particle2[j])) #id1
            result2.write(' '+ str(x_particle2[i])) #id1
            result2.write(' '+ str(x_particle2[j])) #id1
            result2.write(' '+ str(y_particle2[i])) #id1
            result2.write(' '+ str(y_particle2[j])) #id1
            result2.write(' '+ str(e_particle2[i])) #id1
            result2.write(' '+ str(e_particle2[j])) #id1
            result2.write(' '+ '%6f'%d1)
            result2.write(' '+ '%6f'%d2)
            result2.write('\n')        
result2.close()
data3 = np.concatenate((data1, data2), axis=0)
rows3=rows1+rows2
id_particle3= data3[:, 0]
x_particle3 = data3[:, 1]
y_particle3 = data3[:, 2]
e_particle3 = data3[:, 3]
for i in range(rows3):
    for j in range(i):
        d = np.sqrt(np.square(x_particle3[i]-x_particle3[j])+np.square(y_particle3[i]-y_particle3[j]))
        if(d<limit):
            d1 = np.sqrt(np.square(x_particle3[i])+np.square(y_particle3[i]))
            d2 = np.sqrt(np.square(x_particle3[j])+np.square(y_particle3[j]))
            result3.write('%f'%d) #distance
            result3.write(' '+ str(id_particle3[i])) #id1
            result3.write(' '+ str(id_particle3[j])) #id1
            result3.write(' '+ str(x_particle3[i])) #id1
            result3.write(' '+ str(x_particle3[j])) #id1
            result3.write(' '+ str(y_particle3[i])) #id1
            result3.write(' '+ str(y_particle3[j])) #id1
            result3.write(' '+ str(e_particle3[i])) #id1
            result3.write(' '+ str(e_particle3[j])) #id1
            result3.write(' '+ '%6f'%d1)
            result3.write(' '+ '%6f'%d2)
            result3.write('\n')        
result3.close()

