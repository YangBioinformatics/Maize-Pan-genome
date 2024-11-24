#!/bin/bash
# merge bam files
genome_name=$1
ls *.sortedByCoord.out.bam > input.fofn
/data/yjwang/BIO-analysistools/samtools_1.12/bin/samtools merge --threads 36 -O BAM -b input.fofn merged_${genome_name}.bam
