#!/bin/bash
# use STAR to find splicing junction site
index=$1
prefix=$2
path="./RNA_data"
read1=${prefix}_good_1.fq.gz
read2=${prefix}_good_2.fq.gz

/data/yjwang/BIO-analysistools/STAR-2.7.7a/bin/Linux_x86_64/STAR \
--genomeDir $index \
--runThreadN 32 \
--runMode alignReads \
--readFilesIn ${path}/${read1} ${path}/${read2} \
--readFilesCommand zcat \
--outFileNamePrefix "${prefix}_" \
--outSAMtype None
