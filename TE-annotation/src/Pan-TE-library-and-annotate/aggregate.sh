#!/bin/bash
# referred from https://github.com/HuffordLab/NAM-genomes/tree/master/te-annotation
# use this after get classification information to aggregate novel TE libraries
i=0
for j in *.real.ori; do
  i=$(($i+5000));
  /data/yjwang/anaconda3/envs/EDTA/bin/perl /data/yjwang/Genomics-Analysis/TE/EDTA-1.9.0/util/rename_TE.pl $j $i;
done > QIN.PAN-TElib.fa.raw
/data/yjwang/anaconda3/envs/EDTA/bin/perl /data/yjwang/Genomics-Analysis/TE/EDTA-1.9.0/util/rename_TE.pl QIN.PAN-TElib.fa.raw > QIN.PAN-TElib.fa.raw2
mv QIN.PAN-TElib.fa.raw2 QIN.PAN-TElib.fa.raw
