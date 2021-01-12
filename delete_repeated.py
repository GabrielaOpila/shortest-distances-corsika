# This program opens file all.txt and removes duplicate lines and writes the
# contents to no_repeat.txt file.
import sys
plik = sys.argv[1]
lines_seen = set()  # holds lines already seen
nazwa='no_repeat_77402-everything.txt'
outfile = open(nazwa, "w")
infile = open(plik, "r")

for line in infile:
   # print line
    if line not in lines_seen:  # not a duplicate
        outfile.write(line)
        lines_seen.add(line)
outfile.close()
for line in open(nazwa, "r"):
    print(line)
