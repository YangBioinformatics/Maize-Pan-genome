#!/bin/bash
# referred from https://github.com/HuffordLab/NAM-genomes/tree/master/te-annotation
# use pan-TE lib to re-mask all genome
lib=/data/yjwang/Genomics-Analysis/NAM_anno_module/final_TE/make_pan_TE_lib/QIN.PAN-TElib.fa
genome=`realpath "$1"`
echo $lib
echo $genome
/data/yjwang/BIO-analysistools/LAI/RepeatMasker/RepeatMasker -pa 12 \
  -q \
  -div 40 \
  -lib $lib \
  -dir . \
  -cutoff 225 \
  -gff $genome
