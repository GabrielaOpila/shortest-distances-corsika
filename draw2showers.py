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
t1 = pd.read_table(plik1, delimiter = ' ') #read dat file, get rid of *** in 1st and 3rd row
t2 = pd.read_table(plik2, delimiter = ' ') #read dat file, get rid of *** in 1st and 3rd row
print(t2)
print(t1)
#print('\nDataFrame datatypes :\n', t.dtypes) #just to check what datatypes we have
arr1 = t1.to_numpy() #because numpy array is more comfortable to work with than  pandas DataFrame
#print('\nNumpy Array\n----------\n', arr)
arr2 = t2.to_numpy() #because numpy array is more comfortable to work with than  pandas DataFrame
data1 = arr1[:, [2,3,4]]
data2 = arr2[:, [2,3,4]]
#File_object = open(r"data.dat", "w")
#File_object.write(data)
#File_object.close()
#'''
x_particle1 = data1[:, 0]
y_particle1 = data1[:, 1]
e_particle1 = data1[:, 2]
x_particle2 = data2[:, 0]
y_particle2 = data2[:, 1]
e_particle2 = data2[:, 2]


fig = plt.figure()
ax1 = fig.add_subplot(111)
scatterplocik = ax1.scatter(x_particle1, y_particle1,   color='green', s=1)
#scatterplocik = ax.scatter(x_particle, y_particle, c=e_particle, s=1)
plt.xlabel("x [cm]")
plt.ylabel("y [cm]")
#plt.title("Energy [GeV]")
#plt.title("Distribution of particles on the ground\n and their energies [GeV]")
plt.xlim([-100000, 100000])
plt.ylim([-100000, 100000])
plt.gca().set_aspect('equal', adjustable='box')

#plt.hold(True)
scatterplocik2 = ax1.scatter(x_particle2, y_particle2,   color='darkviolet', s=1)
ax1.legend((scatterplocik, scatterplocik2), ('A sample shower', 'Another sample shower, shifted'))
imagename = str(sys.argv[1])
outfilename=imagename+'.png'
plt.savefig(outfilename)
#plt.show()
