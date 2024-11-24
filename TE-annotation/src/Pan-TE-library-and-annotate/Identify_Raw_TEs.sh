#!/bin/bash
# get raw TE lib
genome="$1" # genome fasta
type="$2" # tir, ltr, helitron
genome_path=`realpath $genome`
echo ${genome_path}
echo $type
/data/yjwang/anaconda3/envs/EDTA/bin/perl /data/yjwang/Genomics-Analysis/TE/EDTA-1.9.0/EDTA_raw.pl \
--genome $genome \
--species Maize \
--type $type \
-t 16
