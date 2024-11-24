#!/bin/bash
# use STAR to build index
indexdir="$1"
genome=$2
mkdir -p $indexdir
/data/yjwang/BIO-analysistools/STAR-2.7.7a/bin/Linux_x86_64/STAR \
--runMode genomeGenerate \
--runThreadN 36 \
--genomeDir ${indexdir} \
--genomeFastaFiles ${genome}
