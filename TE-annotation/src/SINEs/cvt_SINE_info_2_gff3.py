#!/bin/env python

import sys

count = 1

tag = 'SineFinder' + '\t' + 'SINE_element'

#with open('C:/Users/Yijie Wang/Desktop/CIMBL70.SINE.txt') as file:
with open(sys.argv[1]) as file:
    for x in file:
        y = (x.strip()).split()
        ID = 'RTSINE' + str(count)
        Name = 'Name=' + ID + '_' + '_'.join(y[4:7])
        strA = str(y[0]) + '\t' + tag
        strB = '\t'.join(y[2:4]) + '\t' + '.' + '\t' + '+' + '\t' + '.'
        Res = strA + '\t' + strB + '\t' + 'ID=' + ID + ';' + Name
        print(Res)
        count = count + 1
