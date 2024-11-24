#!/bin/bash
# use STAR to align RNA-seq data to target genome with splicing junction information
index=$1
prefix=$2
path="./RNA_data"
read1=${prefix}_good_1.fq.gz
read2=${prefix}_good_2.fq.gz

/data/yjwang/BIO-analysistools/STAR-2.7.7a/bin/Linux_x86_64/STAR \
--genomeDir $index \
--runThreadN 64 \
--sjdbFileChrStartEnd SJ.all \
--runMode alignReads \
--readFilesIn $path/$read1 $path/$read2 \
--outSAMstrandField intronMotif \
--readFilesCommand zcat \
--outSAMattributes All \
--outSAMmapqUnique 10 \
--outFilterMismatchNmax 0 \
--outFileNamePrefix ${prefix}_round-2 \
--outBAMsortingThreadN 10 \
--limitBAMsortRAM 50000000000 \
--outSAMtype BAM SortedByCoordinate \
--outWigType bedGraph read1_5p
