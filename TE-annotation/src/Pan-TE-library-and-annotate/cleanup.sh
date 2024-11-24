#!/bin/bash
# referred from https://github.com/HuffordLab/NAM-genomes/tree/master/te-annotation
# use this to remove redundant TEs after the aggregate step
/data/yjwang/anaconda3/envs/EDTA/bin/perl /data/yjwang/Genomics-Analysis/TE/EDTA-1.9.0/util/cleanup_nested.pl \
    -in QIN.PAN-TElib.fa.raw\
    -cov 0.95 \
    -minlen 80 \
    -miniden 80 \
    -t 36
