#!/bin/env python

# add canonical symbol to the canonical transcripts for each gene

import sys
import re

# Usage python set_canonical_mRNA2gff3.py CIMBL70.canonical.transcripts.ID CIMBL70.gff3

canonical_mRNA_ID = sys.argv[1]
ori_gff3 = sys.argv[2]
cID = []
suffix = ';canonical_transcript=1'


# with open('C:/Users/Yijie Wang/Desktop/CIMBL70.canonical.transcripts.ID') as Afile:
with open(sys.argv[1]) as Afile:
    for y in Afile:
        my = y.strip()
        cID.append(my)


# with open('C:/Users/Yijie Wang/Desktop/CIMBL70.gff3') as Bfile:
with open(sys.argv[2]) as Bfile:
    for x in Bfile:
        mx = (x.strip()).split()
        if mx[2] == 'mRNA':
            mRNA = ((((x.strip()).split(';'))[0]).split('='))[1]
            # print(mRNA)
            if mRNA in cID:
                myString = str((x.strip())) + suffix
                print(myString)
            else:
                print(x)
        else:
            print(x)
