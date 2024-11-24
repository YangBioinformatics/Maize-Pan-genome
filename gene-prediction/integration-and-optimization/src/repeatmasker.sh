#!/bin/bash
# maske genome with RepeatMasker

genome=`realpath "$1"`

echo $genome
/data/yjwang/BIO-analysistools/LAI/RepeatMasker/RepeatMasker -pa 12 \
  -q \
  -div 40 \
  -dir . \
  -cutoff 225 \
  -gff $genome
