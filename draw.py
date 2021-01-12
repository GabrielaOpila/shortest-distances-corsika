import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sb
import matplotlib.ticker as ticker
import matplotlib.cm as cm
import matplotlib as mpl
import sys
plik = sys.argv[1]

t = pd.read_table(plik, delimiter ='*') #read dat file, get rid of *** in 1st and 3rd row
#print(t)
#print('\nDataFrame datatypes :\n', t.dtypes) #just to check what datatypes we have
arr = t.to_numpy() #because numpy array is more comfortable to work with than  pandas DataFrame
#print('\nNumpy Array\n----------\n', arr)


data = arr[:, [1,2,3]]
#File_object = open(r"data.dat", "w")
#File_object.write(data)
#File_object.close()
#'''
x_particle = data[:, 0]
y_particle = data[:, 1]
e_particle = data[:, 2]

fig, ax = plt.subplots()
scatterplocik = ax.scatter(x_particle, y_particle, c=e_particle,  cmap="gist_rainbow", s=1)
#scatterplocik = ax.scatter(x_particle, y_particle, c=e_particle, s=1)
plt.xlabel("x [cm]")
plt.ylabel("y [cm]")
#plt.title("Energy [GeV]")
#plt.title("Distribution of particles on the ground\n and their energies [GeV]")
plt.xlim([-100000, 100000])
plt.ylim([-100000, 100000])
plt.gca().set_aspect('equal', adjustable='box')
cbar = fig.colorbar(scatterplocik)
cbar.set_label('Energy [GeV]', rotation = 270, labelpad = 10)
imagename = str(sys.argv[1])
outfilename=imagename+'.png'
plt.savefig(outfilename)
#plt.show()
