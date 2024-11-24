#!/bin/bash
# referred from https://github.com/HuffordLab/NAM-genomes/tree/master/te-annotation
# use this to remove redundant TEs after remove the redundant TEs
/data/yjwang/anaconda3/envs/EDTA/bin/perl /data/yjwang/Genomics-Analysis/TE/EDTA-1.9.0/util/output_by_list.pl \
1 \
 QIN.PAN-TElib.fa.raw.cln \
1 \
rm.list2 \
-ex \
-FA \
> QIN.PAN-TElib.fa.raw.cln2

/data/yjwang/anaconda3/envs/EDTA/bin/perl \
/data/yjwang/Genomics-Analysis/TE/EDTA-1.9.0/util/rename_TE.pl \
QIN.PAN-TElib.fa.raw.cln2 > QIN.PAN-TElib.novel.fa
