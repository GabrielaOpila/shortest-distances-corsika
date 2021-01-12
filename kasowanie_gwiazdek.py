import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sb
import matplotlib.ticker as ticker
import matplotlib.cm as cm
import matplotlib as mpl
import sys
plik = sys.argv[1]
plik2 = sys.argv[2]
#openfile 
with open(plik, 'r+') as f:
#read file 
    file_source = f.read() 
f.close()
replace_string = file_source.replace('*', '')
#replace_string2 = file_source.replace('    ', '')
#save output 

with open(plik2, 'w') as g:
    write_file = g.write(replace_string)
g.close()
replace_string2 = replace_string.replace('    ', '')
with open(plik2, 'w') as g:
    write_file = g.write(replace_string2)
g.close()

