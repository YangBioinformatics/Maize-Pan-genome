#!/bin/bash
# build index
genome="$1" #genome name
mkdir -p ${genome}_STAR_index
/data/yjwang/BIO-analysistools/STAR-2.7.7a/bin/Linux_x86_64/STAR \
--runMode genomeGenerate \
--runThreadN 36 \
--genomeDir ${genome}_STAR_index \
--genomeFastaFiles ${genome}.genome.fa \
--sjdbGTFfile ${genome}.gtf
