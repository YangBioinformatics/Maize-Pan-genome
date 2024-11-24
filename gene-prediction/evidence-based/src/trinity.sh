#!/bin/bash
# use Trinity to assemble transcripts
bam=$1
Trinity \
   --genome_guided_bam ${bam} \
   --max_memory 300G \
   --min_contig_length 100 \
   --genome_guided_max_intron 10000 \
   --full_cleanup \
   --CPU 16

